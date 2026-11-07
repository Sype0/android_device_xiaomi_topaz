#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_topaz.mk

# AOSP android-17.0.0_r1: release config cp2a (alias aosp_current)
COMMON_LUNCH_CHOICES := \
    aosp_topaz-cp2a-user \
    aosp_topaz-cp2a-userdebug \
    aosp_topaz-cp2a-eng
