#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Plain AOSP 17 phone: no vendor/lineage, no GMS.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from topaz device
$(call inherit-product, device/xiaomi/topaz/device.mk)

PRODUCT_NAME := aosp_topaz
PRODUCT_DEVICE := topaz
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 12 4G

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Keep "OEM unlocking" in developer options: a relocked Xiaomi bootloader
# only boots Xiaomi-signed images, so this build must stay unlocked.
PRODUCT_VENDOR_PROPERTIES += \
    ro.oem_unlock_supported=1
