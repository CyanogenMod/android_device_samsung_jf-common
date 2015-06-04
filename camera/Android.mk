LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_NEED_DISABLE_AUTOFOCUS),true)
    LOCAL_CFLAGS += -DDISABLE_AUTOFOCUS
endif

ifneq ($(TARGET_DISABLE_ISO_MODE_1600),true)
    LOCAL_CFLAGS += -DISO_MODE_1600
endif

ifneq ($(TARGET_DISABLE_ISO_MODE_HJR),true)
    LOCAL_CFLAGS += -DISO_MODE_HJR
endif

ifeq ($(TARGET_NEED_EXPOSURE_HACK),true)
    LOCAL_CFLAGS += -DEXPOSURE_HACK
endif

ifeq ($(TARGET_NEED_DISABLE_FACE_DETECTION_BACK),true)
    LOCAL_CFLAGS += -DDISABLE_FACE_DETECTION_BACK
endif

ifeq ($(TARGET_NEED_PREVIEW_SIZE_FIXUP),true)
    LOCAL_CFLAGS += -DPREVIEW_SIZE_FIXUP
endif

LOCAL_C_INCLUDES += \
    system/media/camera/include

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.msm8960
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
