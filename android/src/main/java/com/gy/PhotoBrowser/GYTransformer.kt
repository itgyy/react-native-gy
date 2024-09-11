package com.gy.PhotoBrowser

import android.view.View
import android.widget.ImageView
import com.github.iielse.imageviewer.core.Transformer
import com.gy.Tools.isMainThread

class GYTransformer:Transformer{
  override fun getView(key: Long): ImageView? = provide(key)

  companion object {
    private val transition = HashMap<ImageView, Long>()
    fun put(photoId: Long, imageView: ImageView) {
      require(isMainThread())
      if (!imageView.isAttachedToWindow) return
      imageView.addOnAttachStateChangeListener(object : View.OnAttachStateChangeListener {
        override fun onViewAttachedToWindow(p0: View) = Unit
        override fun onViewDetachedFromWindow(p0: View) {
          transition.remove(imageView)
          imageView.removeOnAttachStateChangeListener(this)
        }
      })
      transition[imageView] = photoId
    }

    private fun provide(photoId: Long): ImageView? {
      transition.keys.forEach {
        if (transition[it] == photoId)
          return it
      }
      return null
    }
  }
}
