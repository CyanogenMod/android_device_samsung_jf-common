$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=jflte \
    TARGET_DEVICE=jflte \
    BUILD_FINGERPRINT="xxxxxxxxxx" \   # handled in variant.sh
    PRIVATE_BUILD_DESC="xxxxxxxxxx"    # handled in variant.sh

PRODUCT_DEVICE := jflte
PRODUCT_NAME := cm_jflte
