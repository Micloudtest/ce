#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#

DEVICE_PATH := device/xiaomi/lancelot

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
SEPOLICY_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS := true

# Build Hack
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

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

# Platform
TARGET_BOARD_PLATFORM := mt6768

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000

# Image
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Clang
TARGET_KERNEL_CLANG_COMPILE := true

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 7327449088
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE  := 7327449088
BOARD_MAIN_PARTITION_LIST := system vendor product

# Target Super
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 220270592
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 220270592
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Userdata Propertirs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# UEFI
TARGET_USES_UEFI := true

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Display
TARGET_SCREEN_DENSITY := 440
TW_BRIGHTNESS_PATH := "/sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 500

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_PREPARE_DATA_MEDIA_EARLY := true

# Security patch level
TW_USE_FSCRYPT_POLICY := 1
PLATFORM_VERSION :=  14
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

ifneq ($(OF_HIDE_NOTCH),1)
  # Configure Status bar icons for regular TWRP builds only
    TW_DEVICE_VERSION := Norikhsan90™
    TW_STATUS_ICONS_ALIGN := center
    TW_CUSTOM_CPU_POS := "300"
    TW_CUSTOM_CLOCK_POS := "60"
    3TW_Y_OFFSET := 80
    3TW_H_OFFSET := -80
endif

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Tool
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

# VNDK Treble
BOARD_VNDK_VERSION := current

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_INCLUDE_NTFS_3G    := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS  := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_SCREEN_BLANK_ON_BOOT := true
RECOVERY_SDCARD_ON_DATA := true

# Removes the loop block errors after flashing ZIPs (Workaround) 
TW_IGNORE_LOGICAL_MOUNT_ERRORS := true
TW_LOOP_DEVICE_ERRORS_TO_LOG := true

# TW Screenshot
TW_INCLUDE_FB2PNG := true

# USB Configuration
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Log
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# SHRP flags
# maintainer
SHRP_MAINTAINER := "Tapin Recovery Instraller"

# device
SHRP_DEVICE_CODE := lancelot
SHRP_PATH := device/xiaomi/lancelot
SHRP_REC_TYPE := Normal
SHRP_REC := /dev/block/by-name/recovery
SHRP_HAS_RECOVERY_PARTITION := true
SHRP_DEVICE_TYPE := A_Only

# mount points
SHRP_INTERNAL := /sdcard
SHRP_EXTERNAL := /external_sd
SHRP_OTG := /usb_otg

# theming
SHRP_DARK := true

# "SHRP Express"
SHRP_EXPRESS := true
SHRP_EXPRESS_USE_DATA := true

# Removes the loop block errors after flashing ZIPs (Workaround) 
SHRP_IGNORE_LOGICAL_MOUNT_ERRORS := true
SHRP_LOOP_DEVICE_ERRORS_TO_LOG := true

# status bar padding
SHRP_STATUSBAR_RIGHT_PADDING := 64
SHRP_STATUSBAR_LEFT_PADDING := 64

# skip all addons
SHRP_SKIP_DEFAULT_ADDON_1 := true
SHRP_SKIP_DEFAULT_ADDON_2 := true
SHRP_SKIP_DEFAULT_ADDON_3 := true
SHRP_SKIP_DEFAULT_ADDON_4 := true
SHRP_EXCLUDE_MAGISK_FLASH := true

# flashlight
SHRP_FLASH := 1
SHRP_CUSTOM_FLASHLIGHT := false
#SHRP_FONP_1 := /sys/devices/platform/flashlights_ocp8132/leds/
