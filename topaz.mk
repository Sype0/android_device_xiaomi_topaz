#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# GrapheneOS phone (unofficial port): no vendor/lineage, no GMS.
# aosp_base_telephony.mk pulls in GrapheneOS's handheld product
# (Vanadium, Camera, Apps, GmsCompat, SetupWizard2, ...).
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from topaz device
$(call inherit-product, device/xiaomi/topaz/device.mk)

# GrapheneOS port specifics (Pixel-only features off, unlocked bootloader)
$(call inherit-product, device/xiaomi/topaz/grapheneos/grapheneos.mk)

# Same naming as GrapheneOS's Pixel products: lunch topaz-cur-<variant>
PRODUCT_NAME := topaz
PRODUCT_DEVICE := topaz
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 12 4G

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
