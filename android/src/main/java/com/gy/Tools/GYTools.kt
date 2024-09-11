package com.gy.Tools

import android.os.Looper
import java.util.regex.Pattern


fun isMainThread() = Looper.myLooper() == Looper.getMainLooper()

object GYTools {
  /**
   * 判断是否是视频
   */
  fun isVideoSource(sourceUrl: String): Boolean {
    return Pattern.compile(".+(://).+\\.(mp4|wmv|avi|mpeg|rm|rmvb|flv|3gp|mov|mkv|mod|)")
      .matcher(sourceUrl).matches()
  }
}
