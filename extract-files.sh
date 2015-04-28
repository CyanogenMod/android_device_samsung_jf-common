#!/bin/bash

export $DEVICE=jf-common

echo
echo "Extracting jf-common blobs..."
echo

# Include extraction utility functions
source ../jf-common/extraction-utils.sh

# Use source specified in the first argument, adb if no argument is specified
check_source $@

# Set extraction output directory and delete previously extracted blobs
BASE=../../../vendor/$VENDOR/jf-common/proprietary
rm -rf $BASE/*

# Extract jf-common blobs
extract ../../$VENDOR/jf-common/common-proprietary-files.txt $BASE

# Create makefiles accordingly to extracted files
./../jf-common/setup-makefiles.sh
