package com.gy

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager
import com.gy.File.GYFile
import com.gy.Hud.GYHud
import com.gy.PhotoBrowser.GYPhotoBrowser
import com.gy.Toast.GYToast


class GyPackage : ReactPackage {
  override fun createNativeModules(reactContext: ReactApplicationContext): List<NativeModule> {
    return listOf(
      GYFile(reactContext),
      GYToast(reactContext),
      GYHud(reactContext),
      GYPhotoBrowser(reactContext),
      )
  }

  override fun createViewManagers(reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
    return emptyList()
  }
}
