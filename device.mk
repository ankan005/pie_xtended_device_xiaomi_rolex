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

export export HAVOC_BUILD_TYPE=Official

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(DEVICE_PATH)/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Snap
PRODUCT_PACKAGES += \
    Snap

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Charger
include $(LOCAL_PATH)/rootdir/charger/charger.mk

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf
    
# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# XiaomiParts
PRODUCT_PACKAGES += \
    XiaomiParts

# QCOM
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/powerhint.xml:system/etc/powerhint.xml \
    $(DEVICE_PATH)/configs/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml \
    $(DEVICE_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# Properties
-include $(DEVICE_PATH)/vendor_prop.mk

# QMI
PRODUCT_PACKAGES += \
    libjson

# VNDK-SP:
PRODUCT_PACKAGES += \
    vndk-sp

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v27/arm64/arch-arm64-armv8-a/shared/vndk-core/android.hardware.gnss@1.0.so:system/lib64/android.hardware.gnss@1.0-v27.so

# Vulkan
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:system/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml

# Wi-Fi
PRODUCT_PACKAGES += \
    libwifi-hal-qcom \
    libcld80211 \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf
    
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(DEVICE_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
