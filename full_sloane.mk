# sloane it's an Android TV
PRODUCT_IS_ATV_SDK := true
PRODUCT_CHARACTERISTICS := tv

# Include drawables for various densities.
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# svox tts languages
-include external/svox/pico/lang/PicoLangDeDeInSystem.mk
-include external/svox/pico/lang/PicoLangEnGBInSystem.mk
-include external/svox/pico/lang/PicoLangEnUsInSystem.mk
-include external/svox/pico/lang/PicoLangEsEsInSystem.mk
-include external/svox/pico/lang/PicoLangFrFrInSystem.mk
-include external/svox/pico/lang/PicoLangItItInSystem.mk

# From build/target/product/core_base.mk
PRODUCT_PACKAGES += \
    ContactsProvider \
    DefaultContainerService \
    UserDictionaryProvider \
    libaudiopreprocessing \
    libfilterpack_imageproc \
    libgabi++ \
    libkeystore \
    libstagefright_soft_aacdec \
    libstagefright_soft_aacenc \
    libstagefright_soft_amrdec \
    libstagefright_soft_amrnbenc \
    libstagefright_soft_amrwbenc \
    libstagefright_soft_flacenc \
    libstagefright_soft_g711dec \
    libstagefright_soft_gsmdec \
    libstagefright_soft_h264dec \
    libstagefright_soft_h264enc \
    libstagefright_soft_hevcdec \
    libstagefright_soft_mp3dec \
    libstagefright_soft_mpeg4dec \
    libstagefright_soft_mpeg4enc \
    libstagefright_soft_opusdec \
    libstagefright_soft_rawdec \
    libstagefright_soft_vorbisdec \
    libstagefright_soft_vpxdec \
    libstagefright_soft_vpxenc \
    mdnsd \
    requestsync

# From build/target/product/core.mk
PRODUCT_PACKAGES += \
    BasicDreams \
    CalendarProvider \
    CertInstaller \
    ExternalStorageProvider \
    FusedLocation \
    InputDevices \
    KeyChain \
    Launcher2 \
    PicoTts \
    PacProcessor \
    PrintSpooler \
    ProxyHandler \
    SharedStorageBackup \
    VpnDialogs

# From build/target/product/generic_no_telephony.mk
PRODUCT_PACKAGES += \
    Bluetooth \
    SystemUI \
    librs_jni \
    audio.primary.default \
    audio_policy.default \
    clatd \
    clatd.conf \
    local_time.default \
    screenrecord   

#TV
PRODUCT_PACKAGES += \
    TvProvider \
    TvSettings \
    tv_input.default \
    LeanbackLauncher \
    LeanbackIme \
    Overscan

# Enable frame-exact AV sync
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.avsync=true

# Zygote it's 64bit
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	#ro.zygote=zygote64_32
# Using prebuilt boot.img :/

# Inherit from fonts/svox
$(call inherit-product-if-exists, frameworks/base/data/sounds/AllAudio.mk)
$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)
$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/dancing-script/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/carrois-gothic-sc/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/coming-soon/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/cutive-mono/fonts.mk)
$(call inherit-product-if-exists, external/lohit-fonts/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/webview/chromium/chromium.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/amazon/sloane/rootdir,root)

# Copy the kernel
PRODUCT_COPY_FILES += \
        device/amazon/sloane/prebuilt/kernel:kernel

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/amazon/sloane/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    device/amazon/sloane/permissions/tv_core_hardware.xml:system/etc/permissions/tv_core_hardware.xml \
    device/amazon/sloane/permissions/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

# Config files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
    device/amazon/sloane/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/amazon/sloane/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/amazon/sloane/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/amazon/sloane/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg

# Fosflags script for boot
PRODUCT_COPY_FILES += device/amazon/sloane/rootdir/init.fosflags.sh:system/etc/init.fosflags.sh

# rbox's TWRP
PRODUCT_COPY_FILES += \
    device/amazon/sloane/prebuilt/binaries/2ndinit:system/etc/recovery/2ndinit \
    device/amazon/sloane/prebuilt/binaries/2ndinitstub:system/bin/ext4_resize \
    device/amazon/sloane/prebuilt/ramdisk-recovery.cpio.lzma:system/etc/recovery/ramdisk-recovery.cpio.lzma

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal.policy.conf:system/etc/.tp/thermal.policy.conf \
     $(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc

# Audio
PRODUCT_PACKAGES += \
        audio.a2dp.default \
        libtinycompress

# Bluetooth
PRODUCT_PACKAGES += \
        bluetooth.default

# Power
PRODUCT_PACKAGES += \
        power.default

# network
PRODUCT_PACKAGES += \
    netd

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/amazon/sloane/sloane-vendor.mk)
