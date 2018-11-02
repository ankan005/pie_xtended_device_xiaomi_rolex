#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := $(LOCAL_PATH)

#HWIU
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay
#    $(DEVICE_PATH)/overlay-lineage

# Include device-specific product fragments
include $(DEVICE_PATH)/product/*.mk

# Inherit proprietary files
$(call inherit-product-if-exists, vendor/xiaomi/rolex/rolex-vendor.mk)

PRODUCT_PACKAGES += \
    GoogleCamera \

# Telephony packages PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/lib/libts_detected_face_jni.so:system/lib64/libts_detected_face_jni.so \
$(LOCAL_PATH)/prebuilts/lib/libts_face_beautify_hal.so:system/lib64/libts_face_beautify_hal.so \
$(LOCAL_PATH)/prebuilts/lib/libts_face_beautify_jni.so:system/lib64/libts_face_beautify_jni.so  \
