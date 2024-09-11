package com.gy.PhotoBrowser

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.bridge.ReadableMap
import com.github.iielse.imageviewer.ImageViewerBuilder
import com.github.iielse.imageviewer.adapter.ItemType
import com.github.iielse.imageviewer.core.Photo
import com.github.iielse.imageviewer.core.SimpleDataProvider
import com.orhanobut.logger.Logger
import java.util.HashMap

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
        obj = GYPhoto(id = i.toLong(),ItemType.PHOTO,url)
      }
      if(videoUrl!= null && videoUrl.length != 0){
        obj = GYPhoto(id = i.toLong(),ItemType.VIDEO,videoUrl)
      }
      Logger.d(obj)
      if(obj != null){
        photoArray = photoArray.plus(obj as GYPhoto);
      }
    }
    val builder =  ImageViewerBuilder(
      context = currentActivity,
      dataProvider = SimpleDataProvider(photoArray.get(index),photoArray),
      imageLoader = GYImageLoader(),
      transformer = GYTransformer()
    )

    builder.show();
  }


}
