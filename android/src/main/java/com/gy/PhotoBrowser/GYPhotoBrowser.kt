package com.gy.PhotoBrowser

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.bridge.ReadableMap
import com.flyjingfish.openimagelib.BaseInnerFragment
import com.flyjingfish.openimagelib.OpenImage
import com.flyjingfish.openimagelib.beans.CloseParams
import com.flyjingfish.openimagelib.beans.OpenImageUrl
import com.flyjingfish.openimagelib.listener.OnItemClickListener
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

    var photoArray = listOf<GYPhoto>()
    for (i in 0..datas.size()-1){
      val item: HashMap<String, Any> = datas.getMap(i).toHashMap();
      val url:String = item.get("url").toString();
      val videoUrl:String = item.get("videoUrl").toString();
      var obj: Any? = null;
      if(url!= null && url.length != 0){
        obj = GYPhoto(url,"");
      }
      if(videoUrl!= null && videoUrl.length != 0){
        obj = GYPhoto(url,videoUrl);
      }
      if(obj != null){
        photoArray = photoArray.plus(obj as GYPhoto);
      }
    }
    Logger.d(photoArray)
    val browser:OpenImage = OpenImage.with(currentActivity)
      .setNoneClickView()
      .setImageUrlList(photoArray)
      .setClickPosition(index)
      browser.show();
  }


}
