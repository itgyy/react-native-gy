package com.gy.PhotoBrowser

import com.github.iielse.imageviewer.adapter.ItemType
import com.github.iielse.imageviewer.core.Photo
import com.gy.Tools.GYTools

class GYPhoto(
  val id: Long,
  val type:Int,
  val url: String,
  val subsampling: Boolean = false,
) : Photo {
  override fun id(): Long = id;

  override fun itemType(): Int {
    return when {
      subsampling -> ItemType.SUBSAMPLING
      else -> type
    }
  }
}
