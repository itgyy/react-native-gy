package com.gy.Hud

import android.graphics.Color
import android.view.View
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.gy.R
import com.kongzue.dialogx.dialogs.WaitDialog
import com.kongzue.dialogx.interfaces.OnBackPressedListener
import com.kongzue.dialogx.interfaces.OnBindView


class GYHud  (reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext){
  override fun getName(): String {
    return "GYHud"
  }

  override fun initialize() {
    super.initialize()
  }

  override fun invalidate() {
    super.invalidate()
  }

  private fun showWaitDialog(status:String?){
    var msg = "";
    if(status != null && status.length != 0){
      msg = status;
    }
    WaitDialog.show(msg)
      .setMaskColor(Color.parseColor("#00000000"))
      .setCustomView(object : OnBindView<WaitDialog>(R.layout.gy_hud_circle){
        override fun onBind(dialog: WaitDialog?, v: View?) {
        }
      })
      .setOnBackPressedListener(object : OnBackPressedListener<WaitDialog> {
        override fun onBackPressed(dialog: WaitDialog?): Boolean {
          return false;
        }
      })
  }

  @ReactMethod
  fun show(){
    showWaitDialog(null);
  }

  @ReactMethod
  fun showStatus(status:String){
    showWaitDialog(status);
  }

  @ReactMethod
  fun dismiss(){
    WaitDialog.dismiss();
  }


}

