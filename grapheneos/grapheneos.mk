#
# SPDX-License-Identifier: Apache-2.0
#
# Unofficial GrapheneOS port to the Redmi Note 12 4G (topaz/tapas).
#
# GrapheneOS gates most of its Pixel-only features at runtime and they stay off
# here: battery charge limit, Google Settings features and the HEF display
# option check Build.MANUFACTURER == "Google"; memory tagging needs MTE (SM6225
# is ARMv8.0); the prototype device notice only looks at Google hardware. The
# overlay below pins the remaining resource switches to their "not a Pixel"
# values, so a framework default change upstream can't turn them on.
#
# Bootloader: this port never relocks it. Xiaomi bootloaders only accept
# Xiaomi-signed images when locked, so a relock would leave the phone unbootable.
# SetupWizard2 (Sype0 fork) therefore skips GrapheneOS's "bootloader is unlocked"
# screen and does not offer to turn off OEM unlocking.

DEVICE_PACKAGE_OVERLAYS += device/xiaomi/topaz/grapheneos/overlay

# GrapheneOS's OTA client (Updater) is left out: build/make only adds it for
# OFFICIAL_BUILD=true, which this build never sets (its servers only serve
# Pixel releases). Pixel eSIM/firmware helpers come from adevtool-generated
# Pixel trees and are not part of this product.

# Keep "OEM unlocking" in developer options: the bootloader is unlocked and
# must stay that way for this build to boot.
PRODUCT_VENDOR_PROPERTIES += \
    ro.oem_unlock_supported=1
