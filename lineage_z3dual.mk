# Copyright (C) 2011-2012 The Android Open Source Project
#           (C) 2013-2016 The CyanogenMod Project
#           (C) 2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from z3dual device
$(call inherit-product, device/sony/z3dual/z3dual.mk)

# Call the proprietary setup
$(call inherit-product, vendor/sony/z3dual/z3dual-vendor.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := lineage_z3dual
PRODUCT_DEVICE := z3dual
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia Z3 Dual
PRODUCT_MANUFACTURER := Sony
PRODUCT_GMS_CLIENTID_BASE := android-sony
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="D6633-user 6.0.1 23.5.A.1.291 2769308465 release-keys"

BUILD_FINGERPRINT := Sony/D6633/D6633:6.0.1/23.5.A.1.291/2769308465:user/release-keys

