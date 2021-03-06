#
# Copyright (C) 2013 The Android Open-Source Project
# Copyright (C) 2013-2016 The CyanogenMod Project
# Copyright (C) 2020-2021 The LineageOS Project
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

# Include z3 dual specific blobs
$(call inherit-product, vendor/sony/z3dual/z3dual-vendor.mk)

# Properties
include $(LOCAL_PATH)/system_prop.mk

# Inherit the z3 definitions
$(call inherit-product, device/sony/z3/z3.mk)
