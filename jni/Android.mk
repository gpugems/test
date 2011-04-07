LOCAL_PATH := $(call my-dir)

# static version of libiconv
include $(CLEAR_VARS)
LOCAL_MODULE := libiconv_static
LOCAL_SRC_FILES := sysroot/lib/libiconv.a sysroot/lib/libcharset.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libiconv
include $(CLEAR_VARS)
LOCAL_MODULE := libiconv_shared
LOCAL_SRC_FILES := sysroot/lib/libiconv.so sysroot/lib/libcharset.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of gettext
include $(CLEAR_VARS)
LOCAL_MODULE := gettext_static
LOCAL_SRC_FILES := sysroot/lib/libgettextpo.a sysroot/lib/libintl.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of gettext
include $(CLEAR_VARS)
LOCAL_MODULE := gettext_shared
LOCAL_SRC_FILES := sysroot/lib/libgettextpo.so sysroot/lib/libintl.so
# XXX also: sysroot/lib/libgettextsrc.so sysroot/lib/libgettextlib.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of glib
include $(CLEAR_VARS)
LOCAL_MODULE := glib_static
LOCAL_SRC_FILES := sysroot/lib/libgio-2.0.a sysroot/lib/libglib-2.0.a \
                   sysroot/lib/libgmodule-2.0.a sysroot/lib/libgobject-2.0.a \
                   sysroot/lib/libgthread-2.0.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of glib
include $(CLEAR_VARS)
LOCAL_MODULE := glib_shared
LOCAL_SRC_FILES := sysroot/lib/libgio-2.0.so sysroot/lib/libglib-2.0.so \
                   sysroot/lib/libgmodule-2.0.so sysroot/lib/libgobject-2.0.so \
                   sysroot/lib/libgthread-2.0.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of pixman
include $(CLEAR_VARS)
LOCAL_MODULE := pixman_static
LOCAL_SRC_FILES := sysroot/lib/libpixman-1.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of pixman
include $(CLEAR_VARS)
LOCAL_MODULE := pixman_shared
LOCAL_SRC_FILES := sysroot/lib/libpixman-1.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of freetype
include $(CLEAR_VARS)
LOCAL_MODULE := freetype_static
LOCAL_SRC_FILES := sysroot/lib/libfreetype.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of freetype
include $(CLEAR_VARS)
LOCAL_MODULE := freetype_shared
LOCAL_SRC_FILES := sysroot/lib/libfreetype.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of libxml2
include $(CLEAR_VARS)
LOCAL_MODULE := libxml2_static
LOCAL_SRC_FILES := sysroot/lib/libxml2.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of libxml2
include $(CLEAR_VARS)
LOCAL_MODULE := libxml2_shared
LOCAL_SRC_FILES := sysroot/lib/libxml2.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of fontconfig
include $(CLEAR_VARS)
LOCAL_MODULE := fontconfig_static
LOCAL_SRC_FILES := sysroot/lib/libfontconfig.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of fontconfig
include $(CLEAR_VARS)
LOCAL_MODULE := fontconfig_shared
LOCAL_SRC_FILES := sysroot/lib/libfontconfig.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of cairo
include $(CLEAR_VARS)
LOCAL_MODULE := cairo_static
LOCAL_SRC_FILES := sysroot/lib/libcairo.a sysroot/lib/libcairo-gobject.a
# also: sysroot/lib/libcairo-script-interpreter.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of cairo
include $(CLEAR_VARS)
LOCAL_MODULE := cairo_shared
LOCAL_SRC_FILES := sysroot/lib/libcairo.so sysroot/lib/libcairo-gobject.so
# also: sysroot/lib/libcairo-script-interpreter.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

# static version of pango
include $(CLEAR_VARS)
LOCAL_MODULE := pango_static
LOCAL_SRC_FILES := sysroot/lib/libpango-1.0.a sysroot/lib/libpangocairo-1.0.a \
                   sysroot/lib/libpangoft2-1.0.a
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_STATIC_LIBRARY)
# shared version of pango
include $(CLEAR_VARS)
LOCAL_MODULE := pango_shared
LOCAL_SRC_FILES := sysroot/lib/libpango-1.0.so sysroot/lib/libpangocairo-1.0.so\
                   sysroot/lib/libpangoft2-1.0.so
LOCAL_EXPORT_C_INCLUDES := sysroot/include
include $(PREBUILT_SHARED_LIBRARY)

