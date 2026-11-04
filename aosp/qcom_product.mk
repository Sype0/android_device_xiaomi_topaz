#
# SPDX-License-Identifier: Apache-2.0
#
# Product side of hardware/qcom-caf/common/BoardConfigQcom.mk and
# vendor/lineage/build/core/qcom_target.mk for bengal (_515 -> sm6225).
# BoardConfigAosp.mk fails the build if this list falls behind.

PRODUCT_SOONG_NAMESPACES += \
    hardware/qcom-caf/sm6225 \
    hardware/qcom-caf/bootctrl \
    vendor/qcom/opensource/commonsys/display \
    vendor/qcom/opensource/commonsys-intf/display \
    hardware/qcom-caf/sm6225/data-ipa-cfg-mgr \
    vendor/qcom/opensource/dataservices \
    hardware/qcom-caf/thermal \
    hardware/qcom-caf/wlan \
    hardware/qcom-caf/wlan/qcwcn

PRODUCT_CFI_INCLUDE_PATHS += \
    hardware/qcom-caf/wlan/qcwcn/wpa_supplicant_8_lib
