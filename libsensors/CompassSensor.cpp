/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fcntl.h>
#include <errno.h>
#include <math.h>
#include <poll.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/select.h>
#include <stdio.h>

#include <cutils/log.h>

#include "CompassSensor.h"
#include "SensorBase.h"

#define LOGTAG "CompassSensor"

/*****************************************************************************/

CompassSensor::CompassSensor()
    : SensorBase(NULL, "geomagnetic_sensor"),
      mEnabled(0),
      mInputReader(4),
      mHasPendingEvent(false)
{
    mPendingEvent.version = sizeof(sensors_event_t);
    mPendingEvent.sensor = ID_M;
    mPendingEvent.type = SENSOR_TYPE_MAGNETIC_FIELD;
    mPendingEvent.magnetic.status = SENSOR_STATUS_ACCURACY_HIGH;
    memset(mPendingEvent.data, 0, sizeof(mPendingEvent.data));

    if (data_fd) {
        strcpy(input_sysfs_path, "/sys/class/input/");
        strcat(input_sysfs_path, input_name);
        strcat(input_sysfs_path, "/device/");
        input_sysfs_path_len = strlen(input_sysfs_path);
        enable(0, 1);
    }
}

CompassSensor::~CompassSensor() {
    if (mEnabled) {
        enable(0, 0);
    }
}

int CompassSensor::setInitialState() {
    return 0;
}

int CompassSensor::setDelay(int32_t handle, int64_t ns)
{
    int fd;
    int val;

    // Kernel driver only support specific values
    if (ns < 20000000L) {
        val = 1;
    } else if (ns < 60000000L) {
        val = 20;
    } else if (ns < 200000000L) {
        val = 60;
    } else if (ns < 1000000000L) {
        val = 200;
    } else {
        val = 1000;
    }

    strcpy(&input_sysfs_path[input_sysfs_path_len], "poll_delay");
    fd = open(input_sysfs_path, O_RDWR);
    if (fd >= 0) {
        char buf[80];
        sprintf(buf, "%d", val);
        write(fd, buf, strlen(buf)+1);
        close(fd);
        return 0;
    }
    return -1;
}

int CompassSensor::enable(int32_t, int en) {
    int flags = en ? 1 : 0;
    int err;
    if (flags != mEnabled) {
         if(err >= 0){
             mEnabled = flags;
             err = sspEnable(LOGTAG, SSP_MAG, en);
             setInitialState();

             return 0;
         }
         return -1;
    }
    return 0;
}

bool CompassSensor::hasPendingEvents() const {
    return mHasPendingEvent;
}

int CompassSensor::readEvents(sensors_event_t* data, int count)
{
    if (count < 1)
        return -EINVAL;

    if (mHasPendingEvent) {
        mHasPendingEvent = false;
        mPendingEvent.timestamp = getTimestamp();
        *data = mPendingEvent;
        return mEnabled ? 1 : 0;
    }

    ssize_t n = mInputReader.fill(data_fd);
    if (n < 0)
        return n;

    int numEventReceived = 0;
    input_event const* event;

    while (count && mInputReader.readEvent(&event)) {
        int type = event->type;
        if (type == EV_REL || type == EV_ABS) {
            float value = event->value;
            if (event->code == EVENT_TYPE_MAGV_X) {
                mPendingEvent.magnetic.x = (float)value / 10.0f + 150;
            } else if (event->code == EVENT_TYPE_MAGV_Y) {
                mPendingEvent.magnetic.y = (float)value / 10.0f + 150;
            } else if (event->code == EVENT_TYPE_MAGV_Z) {
                mPendingEvent.magnetic.z = (float)value / 10.0f + 150;
            } else {
                ALOGE("CompassSensor: unknown event code (type=%d, code=%d)",
                       type, event->code);
            }
        } else if (type == EV_SYN) {
            mPendingEvent.timestamp = timevalToNano(event->time);
            if (mEnabled) {
                *data++ = mPendingEvent;
                count--;
                numEventReceived++;
            }
        } else {
            ALOGE("CompassSensor: unknown event (type=%d, code=%d)",
                    type, event->code);
        }
        mInputReader.next();
    }
    return numEventReceived++;
}
