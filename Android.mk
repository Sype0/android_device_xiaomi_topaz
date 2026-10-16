#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter topaz,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))

# A/B builds require us to create the mount points at compile time.
# Just creating it for all cases since it does not hurt.
FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware_mnt
$(FIRMWARE_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt

BT_FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/bt_firmware
$(BT_FIRMWARE_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(BT_FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/bt_firmware

DSP_MOUNT_POINT := $(TARGET_OUT_VENDOR)/dsp
$(DSP_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(DSP_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/dsp

ALL_DEFAULT_INSTALLED_MODULES += \
    $(FIRMWARE_MOUNT_POINT) \
    $(BT_FIRMWARE_MOUNT_POINT) \
    $(DSP_MOUNT_POINT)

# LineageOS does not install uapi headers for prebuilt kernels, but the CAF
# audio makefiles depend on $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr.
# Install them from the prebuilt headers, like their headers_install target does,
# and clean them for bionic like LineageOS does for its generated headers.
TOPAZ_KERNEL_USR := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
$(TOPAZ_KERNEL_USR): $(shell find $(TARGET_KERNEL_SOURCE) -type f)
	@echo "Installing prebuilt kernel headers to $@"
	rm -rf $@ && mkdir -p $@/include
	cp -a $(TARGET_KERNEL_SOURCE)/. $@/include/
	rm -f $@/include/Makefile
	find $@/include -type f -name "*.h" -exec sed -i 's/struct sched_param/struct __kernel_sched_param/g' {} +
	vendor/lineage/tools/clean_headers.sh $(dir $@)

endif
