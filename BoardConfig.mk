#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#

DEVICE_PATH := device/xiaomi/lancelot

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lancelot
TARGET_NO_BOOTLOADER := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

# Kernel
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_SEPARATED_DTBO := true

# Image
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

IGNORE_UPDATE_LOGICAL_MOUNT_ERROR := true

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 220270592
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 220270592

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    vendor \
    product
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# Userdata Propertirs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
TARGET_BOARD_PLATFORM := mt6768

# UEFI
TARGET_USES_UEFI := true

# System as Root
BOARD_SUPPRESS_SECURE_ERASE := true

# Platform
TARGET_BOARD_PLATFORM := mt6768

# Recovery
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Security Patch
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

ifneq ($(OF_HIDE_NOTCH),1)
  # Configure Status bar icons for regular TWRP builds only
    TW_DEVICE_VERSION := Tapin™
    TW_STATUS_ICONS_ALIGN := center
    TW_CUSTOM_CPU_POS := "290"
    TW_CUSTOM_CLOCK_POS := "70"
    TW_CUSTOM_BATTERY_POS := "790"
endif

# TWRP
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 1024
TW_MAX_BRIGHTNESS := 2047
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_PYTHON := true

# VNDK Treble
BOARD_VNDK_VERSION := current

# Removes the loop block errors after flashing ZIPs (Workaround) 
TW_IGNORE_LOGICAL_MOUNT_ERRORS=1
TW_LOOP_DEVICE_ERRORS_TO_LOG=1

# MIUI 12.xx A11 DECRYPTION
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# TWRP (Crypto)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_PREPARE_DATA_MEDIA_EARLY := true

# TWRP (Debug)
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

#PBRP Flags
PB_DISABLE_DEFAULT_TREBLE_COMP := true

# Disable AVB2.0
PB_DISABLE_DEFAULT_PATCH_AVB2 := true

# Maintener
PB_MAINTAINER = Tapin_Recovery_Instraller
