package com.gy.PhotoBrowser

import com.flyjingfish.openimagelib.beans.OpenImageUrl
import com.flyjingfish.openimagelib.enums.MediaType

class GYPhoto(val img:String,val video:String):OpenImageUrl {

  override fun getImageUrl(): String = img;

  override fun getVideoUrl(): String = video;

  override fun getCoverImageUrl(): String = img;

  override fun getType(): MediaType {
    return when{
      video.length != 0 -> MediaType.VIDEO
      else -> MediaType.IMAGE
    }
  };
}
