#
# SPDX-License-Identifier: Apache-2.0
#
# What LineageOS provides to QCOM device trees from vendor/lineage and its
# build/make changes, for a plain AOSP tree. Included at the end of
# BoardConfig.mk, once TARGET_BOARD_PLATFORM and the feature flags are set.

AOSP_GLUE_PATH := device/xiaomi/topaz/aosp

# Make helpers the CAF HAL makefiles use: is-board-platform-in-list,
# is-vendor-board-platform, project-path-for, ... (vendor/lineage/build/core)
include $(AOSP_GLUE_PATH)/utils.mk
include $(AOSP_GLUE_PATH)/pathmap.mk

# hardware/qcom-caf/common/BoardConfigQcom.mk, see the copy for the changes
include $(AOSP_GLUE_PATH)/BoardConfigQcom.mk

# vendor/lineage/build/core/qcom_target.mk: where the HALs live
$(call project-set-path,qcom-audio,hardware/qcom-caf/$(QCOM_HARDWARE_VARIANT)/audio)
$(call project-set-path,qcom-display,hardware/qcom-caf/$(QCOM_HARDWARE_VARIANT)/display)
$(call project-set-path,qcom-media,hardware/qcom-caf/$(QCOM_HARDWARE_VARIANT)/media)
$(call project-set-path,qcom-bt-vendor,hardware/qcom-caf/bt)
$(call project-set-path,qcom-data-ipa-cfg-mgr,vendor/qcom/opensource/data-ipa-cfg-mgr)
$(call project-set-path,qcom-dataservices,vendor/qcom/opensource/dataservices)
$(call project-set-path,qcom-wlan,hardware/qcom-caf/wlan)

# qcom_product.mk must add every namespace BoardConfigQcom.mk asks for
_qcom_missing_namespaces := $(filter-out $(PRODUCT_SOONG_NAMESPACES),$(QCOM_AOSP_SOONG_NAMESPACES))
ifneq ($(_qcom_missing_namespaces),)
    $(error Add $(_qcom_missing_namespaces) to PRODUCT_SOONG_NAMESPACES in $(AOSP_GLUE_PATH)/qcom_product.mk)
endif

# A few packages in device.mk only exist in LineageOS; warn instead of failing
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
