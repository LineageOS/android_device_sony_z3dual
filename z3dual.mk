# Copyright (C) 2013 The CyanogenMod Project
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

# Include non-opensource parts
# We call this first because z3dual contains some binaries
# which are also present in shinano-common
# For PRODUCT_COPY_FILES, the first rule takes precedence
$(call inherit-product, vendor/sony/z3dual/z3dual-vendor.mk)

# Device specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:root/init.device.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.ril.sh:system/etc/init.qcom.ril.sh

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Inherit the z3 definitions
LOCAL_PATH := device/sony/z3
include device/sony/z3/z3.mk
LOCAL_PATH := $(call my-dir)

# Radio
PRODUCT_PACKAGES += \
    libxml2 \
    libcnefeatureconfig

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(COMMON_PATH)/gps/xtwifi.conf:system/etc/xtwifi.conf
