#
# Copyright (C) 2014-2015 The CyanogenMod Project
# Copyright (C) 2020 The LineageOS Project
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

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.multisim.config=dsds \
    persist.radio.disable_flexmap=1 \
    persist.radio.multisim.config=dsds \
    persist.radio.ignore_dom_time=120 \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=NV,RUIM \
    persist.telephony.oosisdc=false \
    ro.telephony.default_network=9,1 \
    ro.ril.telephony.mqanelements=5 \
    ro.multisim.set_audio_params=true

# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd=true
