LZMA_BOOT_RAMDISK := $(PRODUCT_OUT)/ramdisk-lzma.img

$(LZMA_BOOT_RAMDISK): $(BUILT_RAMDISK_TARGET)
	gunzip -f < $(BUILT_RAMDISK_TARGET) | lzma -9 > $@

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(LZMA_BOOT_RAMDISK)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@ --ramdisk $(LZMA_BOOT_RAMDISK)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

LZMA_RECOVERY_RAMDISK := $(PRODUCT_OUT)/ramdisk-recovery-lzma.img

$(LZMA_RECOVERY_RAMDISK): $(recovery_ramdisk)
	gunzip -f < $(recovery_ramdisk) | lzma -9 > $@

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(LZMA_RECOVERY_RAMDISK) $(recovery_kernel)
	$(call build-recoveryimage-target, $@)
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@ --ramdisk $(LZMA_RECOVERY_RAMDISK)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
