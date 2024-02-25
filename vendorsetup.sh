
# Version / Maintainer infos
export OF_MAINTAINER="Tapin Recovery Instraller"
export FOX_VERSION=R12.1_0
export FOX_BUILD_TYPE="Unofficial"
export TARGET_DEVICE_ALT="lancelot"
export FOX_TARGET_DEVICES="lancelot,shiva"

export TW_DEFAULT_LANGUAGE="en"
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
export OF_QUICK_BACKUP_LIST="/boot;/data;"
export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/recovery"

# Magiskboot
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

# OTA
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
export OF_NO_MIUI_PATCH_WARNING=1

# Binaries
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_GREP_BINARY=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_BRX_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_USE_XZ_UTILS=1
export FOX_REPLACE_BUSYBOX_PS=1
export OF_ENABLE_LPTOOLS=1

# Ensure that /sdcard is bind-unmounted before f2fs data repair or format
export OF_UNBIND_SDCARD_F2FS=1

# Metadata encription
export OF_FBE_METADATA_MOUNT_IGNORE=1

# Display / Leds
export OF_SCREEN_H=2340
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_HIDE_NOTCH=1
export OF_CLOCK_POS=1 # left and right clock positions available
export OF_USE_GREEN_LED=0
export OF_FLASHLIGHT_ENABLE=0

# Removes the loop block errors after flashing ZIPs (Workaround) 
export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
export OF_LOOP_DEVICE_ERRORS_TO_LOG=1

# Run a Process After Formatting Data to Work-Around MTP Issues
export OF_RUN_POST_FORMAT_PROCESS=1

# Other OrangeFox configs
export FOX_DELETE_AROMAFM=1
export OF_PATCH_AVB20=1
export FOX_REPLACE_BUSYBOX_PS="0"

# let's see what are our build VARs
if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
	export | grep "FOX" >> $FOX_BUILD_LOG_FILE
	export | grep "OF_" >> $FOX_BUILD_LOG_FILE
	export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	export | grep "TW_" >> $FOX_BUILD_LOG_FILE
fi    