SUPERUSER_EMBEDDED := true

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/vanilla/overlay/common

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/vanilla/overlay/dictionaries

PRODUCT_PACKAGES += \
    BluetoothExt \
    CellBroadcastReceiver \
    libemoji \
    vanillachocodarkvu.themecmeleven.blackbearblanc \
    LatinImeDictionaryPack \
    ROMControl \
    Stk \
    su \
    VUPapers \
    Torch 
    

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    ro.kernel.android.checkjni=0 \
    persist.sys.root_access=3

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Installer
PRODUCT_COPY_FILES += \
    vendor/vanilla/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/vanilla/prebuilt/common/etc/persist.conf:system/etc/persist.conf

PRODUCT_COPY_FILES += \
    vendor/vanilla/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/vanilla/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/vanilla/prebuilt/common/etc/init.local.rc:root/init.aokp.rc \
    vendor/vanilla/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/vanilla/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/vanilla/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/vanilla/prebuilt/common/bin/sysinit:system/bin/sysinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh \
    sftp \
    scp \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Stagefright FFMPEG plugins
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Inherit common build.prop overrides
-include vendor/vanilla/configs/common_versions.mk

# T-Mobile theme engine
-include vendor/vanilla/configs/themes_common.mk

# common boot animation
PRODUCT_COPY_FILES += \
    vendor/vanilla/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# World APNs
PRODUCT_COPY_FILES += \
    vendor/vanilla/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Qualcomm Optimized Dalvik
 LOCAL_PATH:= vendor/vanilla/prebuilt
 
 ifneq ($(filter msm8610 msm8x26 msm8226 msm8x74 msm8974 msm8960 msm8660 msm7627a msm7630_surf apq8084 mpq8092,$(TARGET_BOARD_PLATFORM)),)
 PRODUCT_COPY_FILES += \
         $(LOCAL_PATH)/bin/dalvikvm:system/bin/dalvikvm \
         $(LOCAL_PATH)/bin/dexopt:system/bin/dexopt \
         $(LOCAL_PATH)/lib/libcutils.so:system/lib/libcutils.so \
         $(LOCAL_PATH)/lib/libdvm.so:system/lib/libdvm.so \
         $(LOCAL_PATH)/lib/libqc-opt.so:system/lib/libqc-opt.so
 endif
