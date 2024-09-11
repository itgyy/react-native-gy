package com.gy.PhotoBrowser

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.bridge.ReadableMap
import com.orhanobut.logger.Logger

class GYPhotoBrowser(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {
  override fun getName(): String {
    return "GYPhotoBrowser"
  }

  override fun initialize() {
    super.initialize()
  }

  override fun invalidate() {
    super.invalidate()
  }

  @ReactMethod
  fun show(datas: ReadableArray, index: Int, options: ReadableMap?) {
    Logger.d("显示图片浏览器")

  }


}
