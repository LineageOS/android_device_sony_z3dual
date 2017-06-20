# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, device/sony/z3dual/full_z3dual.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=D6633 \
    BUILD_FINGERPRINT=Sony/D6633/D6633:6.0.1/23.5.A.1.291/2769308465:user/release-keys \
    PRIVATE_BUILD_DESC="D6633-user 6.0.1 23.5.A.1.291 2769308465 release-keys"

PRODUCT_NAME := lineage_z3dual
PRODUCT_DEVICE := z3dual
