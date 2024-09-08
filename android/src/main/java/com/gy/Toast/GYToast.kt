package com.gy.Toast

import android.app.Application
import android.view.Gravity
import android.widget.Toast
import com.facebook.react.bridge.LifecycleEventListener
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.gy.R
import com.hjq.toast.ToastParams
import com.hjq.toast.Toaster
import com.hjq.toast.config.IToastStyle
import com.orhanobut.logger.Logger

class GYToast (reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext){

  companion object {
    fun init(application: Application) {
      Toaster.init(application);
    }
  }

  override fun getName(): String {
    return "GYToast"
  }
  init {

  }

  override fun initialize() {
    super.initialize()
  }

  override fun invalidate() {
    super.invalidate()
  }

  @ReactMethod
  fun show(msg:String){
    val params = ToastParams();
    params.duration = Toast.LENGTH_LONG;
    params.crossPageShow = false;
    params.text = msg;
    Toaster.setGravity(Gravity.BOTTOM,0,60)
    Toaster.show(params)
  }


}