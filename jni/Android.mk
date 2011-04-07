LOCAL_PATH := $(call my-dir)

# static version of libiconv (from iconv)
include $(CLEAR_VARS)
LOCAL_MODULE := libiconv_static
LOCAL_SRC_FILES := sysroot/lib/libiconv.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libiconv
include $(CLEAR_VARS)
LOCAL_MODULE := libiconv_shared
LOCAL_SRC_FILES := sysroot/lib/libiconv.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libcharset (from iconv)
include $(CLEAR_VARS)
LOCAL_MODULE := libcharset_static
LOCAL_SRC_FILES := sysroot/lib/libcharset.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libcharset
include $(CLEAR_VARS)
LOCAL_MODULE := libcharset_shared
LOCAL_SRC_FILES := sysroot/lib/libcharset.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libgettextpo (from gettext)
# XXX also: sysroot/lib/libgettextsrc.so sysroot/lib/libgettextlib.so
include $(CLEAR_VARS)
LOCAL_MODULE := libgettextpo_static
LOCAL_SRC_FILES := sysroot/lib/libgettextpo.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libgettextpo
include $(CLEAR_VARS)
LOCAL_MODULE := libgettextpo_shared
LOCAL_SRC_FILES := sysroot/lib/libgettextpo.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libintl (from gettext)
include $(CLEAR_VARS)
LOCAL_MODULE := libintl_static
LOCAL_SRC_FILES := sysroot/lib/libintl.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libintl
include $(CLEAR_VARS)
LOCAL_MODULE := libintl_shared
LOCAL_SRC_FILES := sysroot/lib/libintl.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libgio (from glib)
include $(CLEAR_VARS)
LOCAL_MODULE := libgio_static
LOCAL_SRC_FILES := sysroot/lib/libgio-2.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libgio
include $(CLEAR_VARS)
LOCAL_MODULE := libgio_shared
LOCAL_SRC_FILES := sysroot/lib/libgio-2.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libglib (from glib)
include $(CLEAR_VARS)
LOCAL_MODULE := libglib_static
LOCAL_SRC_FILES := sysroot/lib/libglib-2.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libglib
include $(CLEAR_VARS)
LOCAL_MODULE := libglib_shared
LOCAL_SRC_FILES := sysroot/lib/libglib-2.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libgmodule (from glib)
include $(CLEAR_VARS)
LOCAL_MODULE := libgmodule_static
LOCAL_SRC_FILES := sysroot/lib/libgmodule-2.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libgmodule
include $(CLEAR_VARS)
LOCAL_MODULE := libgmodule_shared
LOCAL_SRC_FILES := sysroot/lib/libgmodule-2.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libgobject (from glib)
include $(CLEAR_VARS)
LOCAL_MODULE := libgobject_static
LOCAL_SRC_FILES := sysroot/lib/libgobject-2.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libgobject
include $(CLEAR_VARS)
LOCAL_MODULE := libgobject_shared
LOCAL_SRC_FILES := sysroot/lib/libgobject-2.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libgthread (from glib)
include $(CLEAR_VARS)
LOCAL_MODULE := libgthread_static
LOCAL_SRC_FILES := sysroot/lib/libgthread-2.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libgthread
include $(CLEAR_VARS)
LOCAL_MODULE := libgthread_shared
LOCAL_SRC_FILES := sysroot/lib/libgthread-2.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libpixman (from pixman)
include $(CLEAR_VARS)
LOCAL_MODULE := libpixman_static
LOCAL_SRC_FILES := sysroot/lib/libpixman-1.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libpixman
include $(CLEAR_VARS)
LOCAL_MODULE := libpixman_shared
LOCAL_SRC_FILES := sysroot/lib/libpixman-1.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libfreetype (from freetype)
include $(CLEAR_VARS)
LOCAL_MODULE := libfreetype_static
LOCAL_SRC_FILES := sysroot/lib/libfreetype.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libfreetype
include $(CLEAR_VARS)
LOCAL_MODULE := libfreetype_shared
LOCAL_SRC_FILES := sysroot/lib/libfreetype.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libxml2 (from libxml2)
include $(CLEAR_VARS)
LOCAL_MODULE := libxml2_static
LOCAL_SRC_FILES := sysroot/lib/libxml2.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libxml2
include $(CLEAR_VARS)
LOCAL_MODULE := libxml2_shared
LOCAL_SRC_FILES := sysroot/lib/libxml2.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libfontconfig (from fontconfig)
include $(CLEAR_VARS)
LOCAL_MODULE := libfontconfig_static
LOCAL_SRC_FILES := sysroot/lib/libfontconfig.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libfontconfig
include $(CLEAR_VARS)
LOCAL_MODULE := libfontconfig_shared
LOCAL_SRC_FILES := sysroot/lib/libfontconfig.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libcairo (from cairo)
# also: sysroot/lib/libcairo-script-interpreter.a
include $(CLEAR_VARS)
LOCAL_MODULE := libcairo_static
LOCAL_SRC_FILES := sysroot/lib/libcairo.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libcairo
include $(CLEAR_VARS)
LOCAL_MODULE := libcairo_shared
LOCAL_SRC_FILES := sysroot/lib/libcairo.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libcairo-gobject (from cairo)
include $(CLEAR_VARS)
LOCAL_MODULE := libcairo_gobject_static
LOCAL_SRC_FILES := sysroot/lib/libcairo-gobject.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libcairo-gobject
include $(CLEAR_VARS)
LOCAL_MODULE := libcairo_gobject_shared
LOCAL_SRC_FILES := sysroot/lib/libcairo-gobject.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libpango (from pango)
include $(CLEAR_VARS)
LOCAL_MODULE := libpango_static
LOCAL_SRC_FILES := sysroot/lib/libpango-1.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libpango
include $(CLEAR_VARS)
LOCAL_MODULE := libpango_shared
LOCAL_SRC_FILES := sysroot/lib/libpango-1.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libpangocairo (from pango)
include $(CLEAR_VARS)
LOCAL_MODULE := libpangocairo_static
LOCAL_SRC_FILES := sysroot/lib/libpangocairo-1.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libpangocairo
include $(CLEAR_VARS)
LOCAL_MODULE := libpangocairo_shared
LOCAL_SRC_FILES := sysroot/lib/libpangocairo-1.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libpangoft2 (from pango)
include $(CLEAR_VARS)
LOCAL_MODULE := libpangoft2_static
LOCAL_SRC_FILES := sysroot/lib/libpangoft2-1.0.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libpangoft2
include $(CLEAR_VARS)
LOCAL_MODULE := libpangoft2_shared
LOCAL_SRC_FILES := sysroot/lib/libpangoft2-1.0.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

