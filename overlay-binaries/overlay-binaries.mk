OVERLAY_BIN := device/amazon/sloane/overlay-binaries

# install-recovery.sh & init.fosflags.sh "used" to initialise init.d support	
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/init.fosflags.sh:system/etc/init.fosflags.sh \
	$(OVERLAY_BIN)/install-recovery.sh:system/bin/new-install-recovery.sh \
	$(OVERLAY_BIN)/install-recovery.sh:system/etc/install-recovery-2.sh
	
# Install init.d scripts
PRODUCT_COPY_FILES += \
	$(OVERLAY_BIN)/99exfat-support:system/etc/init.d/99exfat-support \
	$(OVERLAY_BIN)/00permissions:system/etc/init.d/00permissions

# TWRP
PRODUCT_COPY_FILES += \
     $(OVERLAY_BIN)/bootmenu/ramdisk-recovery.cpio.lzma:system/recovery/ramdisk-recovery.cpio.lzma \
     $(OVERLAY_BIN)/bootmenu/2ndinitstub:system/recovery/2ndinitstub \
     $(OVERLAY_BIN)/bootmenu/2ndinit:system/recovery/2ndinit \
     $(OVERLAY_BIN)/bootmenu/manage_recovery:system/xbin/manage_recovery

# Some binaries
PRODUCT_COPY_FILES += \
     $(OVERLAY_BIN)/logger:system/bin/logger
