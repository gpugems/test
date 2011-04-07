LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := pure-ndk
LOCAL_CFLAGS    := -O2 --std=c99 -I. -Wno-missing-field-initializers
LOCAL_LDLIBS    := -lz -lm -llog -landroid
LOCAL_SRC_FILES := pure-ndk.c
LOCAL_STATIC_LIBRARIES := android_native_app_glue \
	libcairo_static libpixman_static \
	libfontconfig_static libfreetype_static libxml2_static libiconv_static

include $(BUILD_SHARED_LIBRARY)

$(call import-module,jni) # my cairo/pango port
$(call import-module,android/native_app_glue)
