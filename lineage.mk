# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, device/sony/z3dual/full_z3dual.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D6633
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/D6633/D6633:5.1.1/23.4.A.0.546/864948651:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="D6633-user 5.1.1 23.4.A.0.546 864948651 release-keys"

PRODUCT_NAME := lineage_z3dual
PRODUCT_DEVICE := z3dual
