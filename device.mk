$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/g2/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

LOCAL_PATH := device/lge/g2

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=3

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8974 \
	gralloc.msm8974 \
	copybit.msm8974

PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/ramdisk/fstab.galbi:root/fstab.galbi \
    $(LOCAL_PATH)/ramdisk/init.g2.blue.sh:root/init.g2.blue.sh \
    $(LOCAL_PATH)/ramdisk/init.g2.rc:root/init.g2.rc \
    $(LOCAL_PATH)/ramdisk/init.g2_product.rc:root/init.g2_product.rc \
    $(LOCAL_PATH)/ramdisk/init.galbi.class_core.sh:root/init.galbi.class_core.sh \
    $(LOCAL_PATH)/ramdisk/init.galbi.class_main.sh:root/init.galbi.class_main.sh \
    $(LOCAL_PATH)/ramdisk/init.galbi.crash.sh:root/init.galbi.crash.sh \
    $(LOCAL_PATH)/ramdisk/init.galbi.early_boot.sh:root/init.galbi.early_boot.sh \
    $(LOCAL_PATH)/ramdisk/init.galbi.rc:root/init.galbi.rc \
    $(LOCAL_PATH)/ramdisk/init.galbi.sh:root/init.galbi.sh \
    $(LOCAL_PATH)/ramdisk/init.galbi.syspart_fixup.sh:root/init.galbi.syspart_fixup.sh \
    $(LOCAL_PATH)/ramdisk/init.galbi.usb.rc:root/init.galbi.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.galbi.usb.sh:root/init.galbi.usb.sh \
    $(LOCAL_PATH)/ramdisk/init.galbi-sensor.sh:root/init.galbi-sensor.sh \
    $(LOCAL_PATH)/ramdisk/init.lge.cmm.usb.sh:root/init.lge.cmm.usb.sh \
    $(LOCAL_PATH)/ramdisk/init.lge.log.rc:root/init.lge.log.rc \
    $(LOCAL_PATH)/ramdisk/init.lge.rc:root/init.lge.rc \
    $(LOCAL_PATH)/ramdisk/init.lge.usb.rc:root/init.lge.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.lge.usb.sh:root/init.lge.usb.sh \
    $(LOCAL_PATH)/ramdisk/init.lge.vzw.usb.sh:root/init.lge.vzw.usb.sh \
    $(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/ramdisk/lgdms.fota.rc:root/lgdms.fota.rc \
    $(LOCAL_PATH)/ramdisk/lgdms.fota_update.rc:root/lgdms.fota_update.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.g2.rc:root/ueventd.g2.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := g2_vzw
PRODUCT_BRAND := LGE
