#!/sbin/sh
# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2013-2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Allows customization for various jflte variants.
#


CMDLINE=`cat /proc/cmdline`
cat /system/build.prop > /tmp/build.prop

if [[ $CMDLINE == *SGH-I337M* ]]; #jfltecan
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jfltevl/jfltecan:4.2.2/JDQ39/I337MVLUAMDJ:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jfltevl-user 4.2.2 JDQ39 I337MVLUAMDJ release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltecan|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SGH-I337M|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltecan|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jfltecan|g' /tmp/build.prop > /tmp/build.prop

elif [[ $CMDLINE == *SGH-I337* ]]; #jflteatt
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jflteuc/jflteatt:4.2.2/JDQ39/I337UCUAMDL:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jflteuc-user 4.2.2 JDQ39 I337UCUAMDL release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jflteatt|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SGH-I337|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jflteatt|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jflteatt|g' /tmp/build.prop > /tmp/build.prop

elif [[ $CMDLINE == *SCH-R970C* ]]; #jfltecri
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jfltecri/jfltecri:4.2.2/JDQ39/R970CVVUAME4:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jfltecri-user 4.2.2 JDQ39 R970CVVUAME4 release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltecri|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SCH-R970C|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltecri|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jfltecri|g' /tmp/build.prop > /tmp/build.prop

elif [[ $CMDLINE == *SCH-R970X* ]]; #jfltecsp
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jfltecsp/jfltecsp:4.2.2/JDQ39/R970XWWUAMFA:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jfltecsp-user 4.2.2 JDQ39 R970XWWUAMFA release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltecsp|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SCH-R970X|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltecsp|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jfltecsp|g' /tmp/build.prop > /tmp/build.prop

elif [[ $CMDLINE == *SPH-L720* ]]; #jfltespr
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jfltespr/jfltespr:4.2.2/JDQ39/L720VPUAMDL:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jfltespr-user 4.2.2 JDQ39 L720VPUAMDL release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltespr|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SPH-L720|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltespr|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jfltespr|g' /tmp/build.prop > /tmp/build.prop

elif [[ $CMDLINE == *SGH-M919* ]]; #jfltetmo
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jfltetmo/jfltetmo:4.3/JSS15J/M919UVUEMK2:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jfltetmo-user 4.3 JSS15J M919UVUEMK2 release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltetmo|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SGH-M919|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltetmo|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jfltetmo|g' /tmp/build.prop > /tmp/build.prop

elif [[ $CMDLINE == *SCH-R970* ]]; #jflteusc
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jflteusc/jflteusc:4.2.2/JDQ39/R970VXUAMD9:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jflteusc-user 4.2.2 JDQ39 R970VXUAMD9 release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jflteusc|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SCH-R970|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jflteusc|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jflteusc|g' /tmp/build.prop > /tmp/build.prop

elif [[ $CMDLINE == *SCH-I545* ]]; #jfltevzw
    then
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=Verizon/jfltevzw/jfltevzw:4.3/JSS15J/I545VRUEMK2:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jfltevzw-user 4.3 JSS15J I545VRUEMK2 release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltevzw|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=SCH-I545|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltevzw|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jfltevzw|g' /tmp/build.prop > /tmp/build.prop
       mkdir -p /system/etc/firmware
       cp -R /system/blobs/vzw/* /system/

else
       sed -e 's|ro.build.fingerprint=xxxxxxxxxx|ro.build.fingerprint=samsung/jfltexx/jflte:4.2.2/JDQ39/I9505XXUAMDE:user/release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.build.description=xxxxxxxxxx|ro.build.description=jfltexx-user 4.2.2 JDQ39 I9505XXUAMDE release-keys' /tmp/build.prop > /tmp/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltexx|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.model=jflte|ro.product.model=GT-I9505|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltexx|g' /tmp/build.prop > /tmp/build.prop
       sed -e 's|ro.cm.device=jflte|ro.cm.device=jfltexx|g' /tmp/build.prop > /tmp/build.prop
fi

cat /tmp/build.prop > /system/build.prop
rm -rf /system/blobs
