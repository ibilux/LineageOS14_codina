#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/codina

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
PRODUCT_VENDOR_KERNEL_HEADERS := $(LOCAL_PATH)/kernel-headers

# gnueabihf-linaro-gcc-4.9.4
DEVICE_ENABLE_TOOLCHAIN := true
BOARD_PROVIDES_LIBRIL := true
BOARD_STE_MODEM := true

# test
# USE_CLANG_PLATFORM_BUILD := false
# LEGACY_USE_JAVA7 := true
# AUDIOSERVER_MULTILIB := 32

# Graphics test
# BOARD_GLOBAL_CFLAGS += -DENABLE_FENCE_TRACKING
BOARD_GLOBAL_CFLAGS += -DHARDWARE_SCHED_FIFO
BOARD_GLOBAL_CFLAGS += -DHARDWARE_FIFO_SENSOR_SERVICE
BOARD_GLOBAL_CFLAGS += -DSHADER_CACHE_OFF
# BOARD_GLOBAL_CFLAGS += -DINVALID_BUFFER_SLOT_OFF
# BOARD_GLOBAL_CFLAGS += -DLEGACY_NEEDS_PUBLIC_LAYERVECTOR
# TARGET_HWUI_NEW_OPS := true

# Don't generate block based zips
BLOCK_BASED_OTA := false
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
# TARGET_NO_SENSOR_PERMISSION_CHECK := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
TARGET_NUPLAYER_CANNOT_SET_SURFACE_WITHOUT_A_FLUSH := true
WITH_CM_CHARGER := false
KERNEL_HAS_FINIT_MODULE := false
BOARD_GLOBAL_CFLAGS += -DREQUIRES_SYNCHRONOUS_SETSURFACE
WITH_SU := true
TARGET_KERNEL_HAVE_EXFAT := true

# Test new
# DEVICE_USE_OFFILNE_COMPILER_SHADER := true
# BOARD_GLOBAL_CFLAGS += -DUSE_OFFLINE_COMPILER_SHADER

# Test new storage
# BOARD_REQUIRES_FORCE_VPARTITION := true

# Test Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
BOARD_GLOBAL_CFLAGS += -DTARGET_LEGACY_CAMERA_HAL1
BOARD_GLOBAL_CFLAGS += -DCAMCORDER_GRALLOC_SOURCE
BOARD_GLOBAL_CFLAGS += -DMETADATA_CAMERA_SOURCE
TARGET_OMX_LEGACY_RESCALING := true
# Screencast Test
# BOARD_GLOBAL_CFLAGS += -DSTE_SCREEN_RECORD
# TARGET_USE_AVC_BASELINE_PROFILE := true
BOARD_GLOBAL_CFLAGS += -DLEGACY_HSR

# Sensors
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

# Bionic
# MALLOC_SVELTE := true
# LIBART_IMG_BASE := 0x30000000

# Board
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_SEPARATE_RECOVERY := true
TARGET_BOOTLOADER_BOARD_NAME := montblanc

# Partitions
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true
# TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
# BOARD_SYSTEMIMAGE_PARTITION_SIZE := 641728512
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 859832320
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 1887436800
BOARD_CACHEIMAGE_PARTITION_SIZE := 136314880
# BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Platform 
TARGET_SOC := u8500
BOARD_USES_STE_HARDWARE := true
TARGET_BOARD_PLATFORM := montblanc
BOARD_GLOBAL_CFLAGS += -DSTE_HARDWARE -DSTE_SAMSUNG_HARDWARE
# BOARD_GLOBAL_CFLAGS += -DSTE_HARDWARE -DSTE_SAMSUNG_HARDWARE -DTARGET_NEEDS_HWC_V0

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_NEON := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x40000000
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/codina/shbootimg.mk
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
TARGET_NO_TWO_STEP_RECOVERY := true

ifeq ($(DEVICE_ENABLE_TOOLCHAIN),true)
# KERNEL_TOOLCHAIN := /home/sergeyl/eabi/prebuilt/lto-toolchains-arm-cortexa9-neon-linux-6.1.0/bin
# KERNEL_TOOLCHAIN_PREFIX := arm-cortexa9_neon-linux-gnueabihf-
# KERNEL_TOOLCHAIN_PREFIX:=$(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-5.3/bin/arm-eabi-
KERNEL_TOOLCHAIN := /home/sergeyl/eabi/prebuilt/armv7a-linux-gnueabihf-gcc-5.2.0_with_isl_x86/bin
KERNEL_TOOLCHAIN_PREFIX := armv7a-linux-gnueabihf-
endif

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH -DBOARD_CANT_REALLOCATE_OMX_BUFFERS
#BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
#BOARD_USES_LEGACY_ACQUIRE_WVM := true
#BOARD_EGL_NEEDS_FNW := true
HWUI_COMPILE_FOR_PERF := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
# WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
# WIFI_DRIVER_NVRAM_PATH           := "/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
BOARD_LEGACY_NL80211_STA_EVENTS  := true
BOARD_NO_APSME_ATTR              := true
# Wifi
# BOARD_WLAN_DEVICE_REV            := bcm4330_b2
# WIFI_BAND                        := 802_11_ABG
# BOARD_HAVE_SAMSUNG_WIFI          := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(LOCAL_PATH)/configs/bluetooth/vnd_u8500.txt

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/codina/configs/ril
BOARD_GLOBAL_CFLAGS += -DSTE_POSIX_CLOCKS

# Audio
# BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
BOARD_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DMR1_AUDIO_BLOB
USE_LEGACY_AUDIO_POLICY := 1
# USE_XML_AUDIO_POLICY_CONF := 1

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Vold
#BOARD_VOLD_MAX_PARTITIONS := 25
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun%d/file"

# Recovery
BOARD_UMS_LUNFILE := "/sys/devices/platform/musb-ux500.0/musb-hdrc/gadget/lun0/file"
BOARD_USES_MMCUTILS := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_RECOVERY_SWIPE := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../../device/samsung/codina/recovery/recovery_keys.c
# Recovery Makefile
# TARGET_RECOVERY_DENSITY := hdpi
# BOARD_HAS_LARGE_FILESYSTEM := true

# SELinux
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy

# Delete the line below when SELinux is enabled on all devices
BOARD_GLOBAL_CFLAGS += -DRECOVERY_CANT_USE_CONFIG_EXT4_FS_XATTR

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)/releasetools

# Blobs
BOARD_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
BOARD_USES_LEGACY_MMAP := true
TARGET_ENABLE_NON_PIE_SUPPORT := true
TARGET_NEEDS_PRELINK_SUPPORT := true

# quick wipe
BOARD_NO_SECURE_DISCARD := true
# BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# == BEGIN LOCAL CONFIG ==
TARGET_OTA_ASSERT_DEVICE := codina,i8160,GT-I8160

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/ChronoKerne3
TARGET_KERNEL_CONFIG := codina_defconfig
# TARGET_KERNEL_CONFIG := codina_nodebug_defconfig
# TARGET_KERNEL_CONFIG := codina_selinux_defconfig
PLATFORM_LINARO_4.9 := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/configs/bluetooth/include

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.samsungcodina

# Boot Animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Charging mode Twrp
ifneq ($(strip $(wildcard $(TOP)/bootable/recovery/variables.h)),)
-include $(LOCAL_PATH)/twrp.mk
else
-include $(LOCAL_PATH)/cwm.mk
endif

# Dex Pre-opt
# WITH_DEXPREOPT := true
# Enable position-independent code for odex files
# WITH_DEXPREOPT_PIC := true
# Disable compression of precompiled odex with gzip
# WITH_DEXPREOPT_COMP := false
# DONT_DEXPREOPT_PREBUILTS := true

# Charging test
# BOARD_CHARGER_DISABLE_INIT_BLANK := true
# BOARD_CHARGING_MODE_BOOTING_LPM := /sys/devices/virtual/power_supply/battery/lpm_mode
# BOARD_CHARGER_ENABLE_SUSPEND := true

# Charging mode
BOARD_NO_CHARGER_LED := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_LPM_BOOT_ARGUMENT_NAME := lpm_boot
BOARD_LPM_BOOT_ARGUMENT_VALUE := 1
