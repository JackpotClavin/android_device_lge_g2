#
# Copyright (C) 2011 The Android Open-Source Project
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

TARGET_SPECIFIC_HEADER_PATH := device/lg/g2/include

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_CMDLINE :=  console=ttyHSL0,115200,n8 androidboot.hardware=g2 user_debug=31 msm_rtb.filter=0x0
BOARD_KERNEL_BASE :=  0x00000000
#BOARD_FORCE_RAMDISK_ADDRESS := 0x05000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x05000000 --dt device/lge/g2/devtree --tags_offset 0x04800000

TARGET_KERNEL_CONFIG := g2-vzw-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/lge/g2
# loki
TARGET_RELEASETOOLS_EXTENSIONS := device/lge/g2/loki

TARGET_BOOTLOADER_BOARD_NAME := msm8974
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

BOARD_EGL_CFG := device/lge/g2/egl.cfg

#BOARD_USES_HGL := true
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP -DLG_CAMERA_HARDWARE

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # 16M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # 16M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3437928448 # 3.2G
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25899925504 # 24.1G
BOARD_FLASH_BLOCK_SIZE := 131072

-include vendor/lg/g2/BoardConfigVendor.mk

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcmdhd_apsta.bin"

BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_USES_QCOM_BSP := true
#TARGET_QCOM_MEDIA_VARIANT := caf
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true

BOARD_USES_ALSA_AUDIO:= true
BOARD_USES_LEGACY_ALSA_AUDIO:= false
TARGET_QCOM_AUDIO_VARIANT := caf
#BOARD_USES_SRS_TRUEMEDIA := true

COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DQCOM_CSDCLIENT_ENABLED #-DQCOM_FM_ENABLED -DQCOM_ANC_HEADSET_ENABLED \
#-DQCOM_AUDIO_FORMAT_ENABLED -DQCOM_PROXY_DEVICE_ENABLED -DQCOM_USBAUDIO_ENABLED

BOARD_HAVE_BLUETOOTH := true

USE_CAMERA_STUB := true

# Recovery:Start

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

# TWRP specific build flags
DEVICE_RESOLUTION := 1080x1920
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TW_BRIGHTNESS_PATH := /sys/devices/platform/msm_fb.590337/leds/lcd-backlight/brightness
#TW_MAX_BRIGHTNESS := 255

