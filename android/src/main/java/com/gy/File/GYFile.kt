package com.gy.File

import android.app.Activity
import android.content.Intent
import android.net.Uri
import com.facebook.react.bridge.ActivityEventListener
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod



class GYFile (reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) , ActivityEventListener {

  private final val REQUEST_CODE = 1;

  override fun initialize() {
    super.initialize()
  }
  override fun invalidate() {
    super.invalidate()
  }
  init {
    reactContext.addActivityEventListener(this)
  }

  override fun getName(): String {
    return "GYFile"
  }

  /**
   * 打开系统文件管理器
   */
  @ReactMethod
  fun openSystemFileManager(){
    val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
      addCategory(Intent.CATEGORY_OPENABLE)
      type = "*/*"
    }
    currentActivity?.startActivityForResult(intent,REQUEST_CODE);
  }

  override fun onActivityResult(activity: Activity, requestCode: Int, resultCode: Int, data: Intent?) {
    if (requestCode == REQUEST_CODE) {
      // 处理结果
      val uri: Uri? = data?.data
      uri?.let {
        // 处理选择的文件
      }
    }
  }

  override fun onNewIntent(p0: Intent?) {

  }

}
