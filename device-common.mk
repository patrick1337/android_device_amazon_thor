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

# This file includes all definitions that apply to ALL msm8960 devices, and
# are also specific to msm8960 devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/amazon/thor-kernel/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi


PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni
#wifi
PRODUCT_COPY_FILES += \
	device/amazon/thor/wifi/WCNSS_qcom_cfg.ini:system/vendor/firmware/wlan/WCNSS_qcom_cfg.ini \
        device/amazon/thor/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/amazon/thor/wifi/wpa_supplicant_ath6kl.conf:system/etc/wifi/wpa_supplicant_ath6kl.conf \
	device/amazon/thor/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

PRODUCT_COPY_FILES += \
	device/amazon/thor/snd_soc_msm_Taiko_tablet:system/etc/snd_soc_msm/snd_soc_msm_2x \
	device/amazon/thor/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	device/amazon/thor/mixer_paths.xml:system/etc/mixer_paths.xml \
	device/amazon/thor/sec_config:system/etc/sec_config

PRODUCT_COPY_FILES += \
	device/amazon/thor/thermal-engine-thor.conf:system/etc/thermal-engine-thor.conf

PRODUCT_COPY_FILES += \
	device/amazon/thor/init.flo.usb.rc:root/init.flo.usb.rc \
	device/amazon/thor/ueventd.flo.rc:root/ueventd.flo.rc \
	device/amazon/thor/media_profiles.xml:system/etc/media_profiles.xml \
	device/amazon/thor/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
	device/amazon/thor/kickstart_checker.sh:system/etc/kickstart_checker.sh

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/amazon/thor/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	device/amazon/thor/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
	device/amazon/thor/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
	device/amazon/thor/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	device/amazon/thor/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
	device/amazon/thor/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
	device/amazon/thor/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
	device/amazon/thor/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
	device/amazon/thor/amazon_touch.idc:system/usr/idc/amazon_touch.idc \
        device/amazon/thor/qwerty.idc:system/usr/idc/qwerty.idc \
        device/amazon/thor/qwerty2.idc:system/usr/idc/qwerty2.idc \
        device/amazon/thor/synaptics_dsx_i2c.idc:system/usr/idc/synaptics_dsx_i2c.idc 

# TP idc file
#PRODUCT_COPY_FILES += \
#	device/amazon/thor/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=196608

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.handset.mic.type=digital \
    persist.audio.dualmic.config=endfire \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=false \
    af.resampler.quality=4

# Camera Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Kickstart
PRODUCT_PACKAGES += \
	qcks \
	ks \
	efsks

#Enable MDP composition by default
PRODUCT_PROPERTY_OVERRIDES += \
	persist.hwc.mdpcomp.enable=true

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	setup_fs

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8974 \
	gralloc.msm8974 \
        keystore.msm8974 \
        memtrack.msm8974

PRODUCT_PACKAGES += \
    audio.primary.msm8974 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors



# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors
PRODUCT_COPY_FILES += \
    device/amazon/thor/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Monitor device rotation for speaker channel swap
PRODUCT_PROPERTY_OVERRIDES += \
	ro.audio.monitorRotation=true

PRODUCT_PACKAGES += \
	hci_qcomm_init

PRODUCT_PACKAGES += \
	power.msm8974

PRODUCT_COPY_FILES += \
	device/amazon/thor/init.flo.bt.sh:system/etc/init.flo.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
	libmmcamera_interface2 \
	libmmcamera_interface \
	libqomx_core

PRODUCT_PACKAGES += \
	mm-vdec-omx-test \
	mm-venc-omx-test720p \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libstagefrighthw \
	libc2dcolorconvert

# GPS
PRODUCT_PACKAGES += \
        libloc_adapter \
        libloc_eng \
        libloc_api_v02 \
        libloc_ds_api \
        libloc_core \
        libizat_core \
        libgeofence \
        libgps.utils \
        gps.conf \
        gps.msm8974 \
        flp.msm8974

PRODUCT_PACKAGES += \
	bdAddrLoader \
	libwfcu \
	conn_init \
	charger_touch

PRODUCT_PACKAGES += \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

PRODUCT_PROPERTY_OVERRIDES += \
        ro.qc.sensors.wl_dis=true \
        ro.qualcomm.sensors.smd=true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.cabl=1 \
	hw.cabl.level=Auto \
	persist.qcom.cabl.video_only=1


# Configure libhwui
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.texture_cache_size=48 \
	ro.hwui.layer_cache_size=32 \
	ro.hwui.r_buffer_cache_size=4 \
	ro.hwui.path_cache_size=24 \
	ro.hwui.gradient_cache_size=1 \
	ro.hwui.drop_shadow_cache_size=5 \
	ro.hwui.texture_cache_flushrate=0.5 \
	ro.hwui.text_small_cache_width=1024 \
	ro.hwui.text_small_cache_height=1024 \
	ro.hwui.text_large_cache_width=2048 \
	ro.hwui.text_large_cache_height=1024




PRODUCT_LOCALES := en_US es_US de_DE zh_CN

$(call inherit-product-if-exists, hardware/qcom/msm8x74/msm8x74.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8x74/msm8x74-gpu-vendor.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)
