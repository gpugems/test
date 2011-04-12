/*
 * Copyright (C) 2010 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <jni.h>
#include <time.h>
#include <android/log.h>
#include <android/bitmap.h>

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include <cairo/cairo.h>
#include <pango/pangocairo.h>

#include <fontconfig.h>

#define  LOG_TAG    "android-cairo-java-bitmap"
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)


int tick = 0;

/* XXX THIS IS A HACK XXX */
// We should really use the Android OBB stuff to create a proper configuration
// filesystem.
#include <stdio.h>
#include "fonts-conf.h"
#define TMP_FONTS_CONF "/mnt/obb/tmp/fonts.conf"
void write_config_file(FcConfig *config) {
    FILE *out;
    FcBool result;

    // write a fonts.conf
    out = fopen(TMP_FONTS_CONF, "w");
    if (!out) {
	LOGE("couldn't write fonts.conf, boo");
	return;
    }
    fwrite(fonts_conf, sizeof(*fonts_conf), sizeof(fonts_conf), out);
    fclose(out);

    // read it in
    result = FcConfigParseAndLoad(config, TMP_FONTS_CONF, 1);
    if (!result) LOGE("FcConfigParseAndLoad failed");
}

JNIEXPORT void JNICALL Java_com_example_cairo_CairoView_loadFonts(JNIEnv * env, jobject  obj) {
    FcPattern *pat;
    FcFontSet *fs;
    FcObjectSet *os;
    FcChar8 *s, *file;
    FcConfig *config;
    FcCache *cache;
    FcBool result;
    int i;

    result = FcInit();
    config = FcConfigGetCurrent();
    FcConfigSetRescanInterval(config, 0);
    //FcConfigAddDir(config, "/system/fonts");
    // write/read config file!
    write_config_file(config);


    // show the fonts (debugging)
    pat = FcPatternCreate();
    os = FcObjectSetBuild (FC_FAMILY, FC_STYLE, FC_LANG, (char *) 0);
    fs = FcFontList(config, pat, os);
    LOGE("Total fonts: %d", fs->nfont);
    for (i=0; fs && i < fs->nfont; i++) {
	FcPattern *font = fs->fonts[i];//FcFontSetFont(fs, i);
	FcPatternPrint(font);
	s = FcNameUnparse(font);
	if (FcPatternGetString(font, FC_FILE, 0, &file) == FcResultMatch) {
	    LOGE("Filename: %s", file);
	}
	LOGE("Font: %s", s);
	free(s);
    }
    if (fs) FcFontSetDestroy(fs);
}

/* This is the string "Pango" in UTF-8 Greek+Japanese */
unsigned char pango_str[] =
{
0xce, 0xa0, 0xce, 0xb1, 0xce, 0xbd, 0xe8, 0xaa, 0x9e, 0
};
/* This is "harfbuzz" is UTF-8 Perisian. */
unsigned char harfbuzz_str[] =
{
0xd8, 0xad, 0xd8, 0xb1, 0xd9, 0x81, 0xe2, 0x80, 0x8c, 0xd8, 0xa8, 0xd8, 0xa7, 0xd8, 0xb2, 0
};


static void draw_text (cairo_t *cr)
{
#define RADIUS 40
#define N_WORDS 5
#define FONT "Droid Sans 8"
  PangoLayout *layout;
  PangoFontDescription *desc;
  int i;
  /* Center coordinates on the middle of the region we are drawing
   */
  cairo_save (cr);
  cairo_translate (cr, 0.5, 0.5);
  cairo_scale(cr, 1/100., 1/100.);
  cairo_set_line_width (cr, 1);

  /* Create a PangoLayout, set the font and text */
  layout = pango_cairo_create_layout (cr);
  desc = pango_font_description_from_string (FONT);
  pango_layout_set_font_description (layout, desc);
  pango_font_description_free (desc);

  pango_layout_set_text (layout, harfbuzz_str/*"HarfBuzz"*/, -1);

  /* Draw the layout N_WORDS times in a circle */
  for (i = 0; i < N_WORDS; i++)
    {
      int width, height;
      double angle = (360. * i) / N_WORDS;
      double red;
      cairo_save (cr);
      /* Gradient from red at angle == 60 to blue at angle == 240 */
      red   = (1 + cos ((angle - 60) * G_PI / 180.)) / 2;
      cairo_set_source_rgb (cr, red, 0, 1.0 - red);
      cairo_rotate (cr, angle * G_PI / 180.);
      /* Inform Pango to re-layout the text with the new transformation */
      pango_cairo_update_layout (cr, layout);
      pango_layout_get_size (layout, &width, &height);
      cairo_move_to (cr, - ((double)width / PANGO_SCALE) / 2, - RADIUS);
      pango_cairo_show_layout (cr, layout);
      cairo_restore (cr);
    }
  cairo_restore (cr);
  /* free the layout object */
  g_object_unref (layout);
}

static void draw_frame(AndroidBitmapInfo *info, void *pixels) {
    cairo_surface_t *surface = NULL;

    /* Setup our cairo surface to render directly to the bitmap */
    if (info->format == ANDROID_BITMAP_FORMAT_RGB_565) {
        surface = cairo_image_surface_create_for_data(pixels, CAIRO_FORMAT_RGB16_565, info->width, info->height, info->stride);
    } else if (info->format == ANDROID_BITMAP_FORMAT_RGBA_8888) {
        surface = cairo_image_surface_create_for_data(pixels, CAIRO_FORMAT_RGB24, info->width, info->height, info->stride);
    } else {
        LOGE("Unsupported buffer format: %d", info->format);
        return;
    }

    cairo_t *cr = cairo_create(surface);

    /* clear the screen */
    memset(pixels, 0, info->stride*info->height);

    /* Normalize our canvas size to make our lives easier */
    cairo_scale(cr, info->width, info->height);


    /* Draw the big X */
    double position = (tick%30)*(1.0/30);
    cairo_set_source_rgba (cr, 0.5, 0.5, 0.5, 0.7);
    cairo_move_to (cr, 0.1, position);
    cairo_line_to (cr, 0.9, 1.0-position);
    cairo_move_to (cr, 0.9, position);
    cairo_line_to (cr, 0.1, 1.0-position);
    cairo_set_line_width (cr, 0.1);
    cairo_set_line_cap(cr, CAIRO_LINE_CAP_ROUND);
    cairo_stroke (cr);

    /* Draw three color squares */
    cairo_rectangle (cr, 0, 0,0.5, 0.5);
    cairo_set_source_rgba (cr, 1, 0, 0, 0.50);
    cairo_fill (cr);

    cairo_rectangle (cr, 0, 0.5, 0.5, 0.5);
    cairo_set_source_rgba (cr, 0, 1, 0, 0.50);
    cairo_fill (cr);

    cairo_rectangle (cr, 0.5, 0, 0.5, 0.5);
    cairo_set_source_rgba (cr, 0, 0, 1, 0.50);
    cairo_fill (cr);

    /* Draw a more complicated path */
    cairo_set_line_width (cr, 0.04);
    cairo_save(cr);
    cairo_scale(cr, 0.5, 0.5);
    cairo_translate(cr, 0.5, 1.0);
    cairo_set_source_rgba (cr, 1.0, 0.2, 0.0, 0.5);
    cairo_move_to (cr, 0.25, 0.25);
    cairo_line_to (cr, 0.5, 0.375);
    cairo_rel_line_to (cr, 0.25, -0.125);
    cairo_arc (cr, 0.5, 0.5, 0.25 * sqrt(2), -0.25 * M_PI, 0.25 * M_PI);
    cairo_rel_curve_to (cr, -0.25, -0.125, -0.25, 0.125, -0.5, 0);
    cairo_close_path (cr);
    cairo_set_line_cap(cr, CAIRO_LINE_CAP_BUTT);
    cairo_stroke (cr);
    cairo_restore(cr);

    /* draw simple text directly w/ Cairo/FreeType */
    cairo_select_font_face (cr, "Droid Sans Fallback", CAIRO_FONT_SLANT_NORMAL,
			    CAIRO_FONT_WEIGHT_BOLD);
    cairo_set_font_size (cr, 0.3);
    cairo_move_to (cr, 0.1, 0.5);
    cairo_show_text (cr, pango_str /*"Hello"*/);

    /* draw text w/ pango */
    draw_text(cr);

   /* Clean up. */
    cairo_destroy(cr);
    cairo_surface_destroy(surface);
}

JNIEXPORT void JNICALL Java_com_example_cairo_CairoView_drawFrame(JNIEnv * env, jobject  obj, jobject bitmap) {
    AndroidBitmapInfo  info;
    void*              pixels;
    int                ret;

    ++tick;

    if ((ret = AndroidBitmap_getInfo(env, bitmap, &info)) < 0) {
        LOGE("AndroidBitmap_getInfo() failed: error=%d", ret);
        return;
    }

    if (info.format != ANDROID_BITMAP_FORMAT_RGB_565 && info.format != ANDROID_BITMAP_FORMAT_RGBA_8888) {
        LOGE("Bitmap format is not RGB_565 or RGBA_8888");
        return;
    }

    if ((ret = AndroidBitmap_lockPixels(env, bitmap, &pixels)) < 0) {
        LOGE("AndroidBitmap_lockPixels() failed: error=%d", ret);
    }

    draw_frame(&info, pixels);

    AndroidBitmap_unlockPixels(env, bitmap);
}
