#
# Copyright (C) 2022 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# ANT+
PRODUCT_PACKAGES += \
    com.dsi.ant@1.0.vendor

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    audio.bluetooth.default \
    libbluetooth_audio_session

PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.0-impl \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Filesystems table
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/init.munch.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.munch.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.target.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.target.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.munch.rc:$(TARGET_COPY_OUT_ODM)/etc/ueventd.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/init.mi.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mi.usb.sh \
    $(LOCAL_PATH)/rootdir/bin/init.qcom.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/bin/init.qti.dcvs.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qti.dcvs.sh

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)-kernel/kernel
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)-kernel/vendor-modules,$(TARGET_COPY_OUT_VENDOR)/lib/modules)

PRODUCT_VENDOR_KERNEL_HEADERS += $(LOCAL_PATH)-kernel/kernel-headers

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Platform
TARGET_BOARD_PLATFORM := kona

# QTI
TARGET_COMMON_QTI_COMPONENTS := all

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 31

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Vendor blobs
$(call inherit-product, vendor/xiaomi/munch/munch-vendor.mk)

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/input/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml
