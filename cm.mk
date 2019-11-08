# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

# Include CM LatinIME dictionaries
#PRODUCT_PACKAGE_OVERLAYS += vendor/cm/overlay/dictionaries

# Inherit device configuration for Fire TV Stick
$(call inherit-product, device/amazon/sloane/full_sloane.mk)

TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024

PRODUCT_DEVICE := sloane
PRODUCT_NAME := cm_sloane
PRODUCT_RELEASE_NAME := sloane
PRODUCT_BRAND := google
PRODUCT_MODEL := sloane
PRODUCT_MANUFACTURER := amzn
