LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := java-bitmap
LOCAL_CFLAGS    := -O2 --std=c99 -I. -Wno-missing-field-initializers
LOCAL_LDLIBS    := -lz -lm -llog -ljnigraphics
LOCAL_SRC_FILES := java-bitmap.c
LOCAL_STATIC_LIBRARIES := \
	libpangocairo_static libpangoft2_static libpango_static \
	libcairo_static libpixman_static \
	libfontconfig_static libfreetype_static libxml2_static libiconv_static\
	libgobject_static libgmodule_static libglib_static libintl_static

include $(BUILD_SHARED_LIBRARY)

$(call import-module,jni) # my cairo/pango port
