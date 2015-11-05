#!/bin/bash

function extract() {
    for FILE in `egrep -v '(^#|^$)' $1`; do
        OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
        FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
        DEST=${PARSING_ARRAY[1]}
        if [ -z $DEST ]; then
            DEST=$FILE
        fi
        DIR=`dirname $FILE`
        if [ ! -d $2/$DIR ]; then
            mkdir -p $2/$DIR
        fi
        if [ "$SRC" = "adb" ]; then
            # Try CM target first
            adb pull /system/$DEST $2/$DEST
            # if file does not exist try OEM target
            if [ "$?" != "0" ]; then
                adb pull /system/$FILE $2/$DEST
            fi
        else
            cp $SRC/system/$FILE $2/$DEST
            # if file dot not exist try destination
            if [ "$?" != "0" ]
                then
                cp $SRC/system/$DEST $2/$DEST
            fi
        fi
    done
}

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi

BLOBLOC=$DEVICE
if [ "$DEVICE" == "jflteatt" ] || [ "$DEVICE" == "jfltecan" ] || [ "$DEVICE" == "jfltetmo" ] || [ "$DEVICE" == "jfltexx" ]; then
    BLOBLOC=jf-gsm-common
fi


BASE=../../../vendor/$VENDOR/jf-common
rm -rf $BASE

DEVBASE=../../../vendor/$VENDOR/$BLOBLOC
rm -rf $DEVBASE

extract ../../$VENDOR/jf-common/common-proprietary-files.txt $BASE/proprietary
extract ../../$VENDOR/$DEVICE/device-proprietary-files.txt $DEVBASE/proprietary

../jf-common/setup-makefiles.sh
