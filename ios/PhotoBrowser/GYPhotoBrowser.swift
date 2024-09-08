//
//  GYPhotoBrowser.swift
//  react-native-gy
//
//  Created by 古耀 on 2024/9/7.
//

import Foundation

@objc(GYPhotoBrowser)
class GYPhotoBrowser: NSObject, GKPhotoBrowserDelegate {
    var browser: GKPhotoBrowser?

    override init() {
        super.init();
        print("XXXXXXXX")
    }

    deinit {
        print("XXXXXXXXdeinit")
    }

    @objc(show:index:options:)
    func show(datas: Array<Dictionary<String, String>>, index: NSInteger,options:Dictionary<String,String>) {
        let photos = converDatas(datas: datas)
        DispatchQueue.main.async { [weak self] in
            if let strongSelf = self {
                strongSelf.browser = GKPhotoBrowser(photos: photos, currentIndex: index)
                strongSelf.browser?.delegate = strongSelf;
                strongSelf.browser?.configure = strongSelf.initConfig(options: options);
                strongSelf.browser!.show(fromVC: GYCore.topVC())
            }
        }
    }

    /**
     组织数据
     */
    private func converDatas(datas: Array<Dictionary<String, String>>) -> Array<GKPhoto> {
        var vals: [GKPhoto] = []
        if datas != nil && datas.count != 0 {
            datas.forEach { element in
                var item = GKPhoto()
                let url = element["url"]
                let videoUrl = element["videoUrl"]
                if (url != nil) && url?.count != 0 {
                    item.url = URL(string: url!)
                }
                if (videoUrl != nil) && videoUrl?.count != 0 {
                    item.videoUrl = URL(string: videoUrl!)
                }

                vals.append(item)
            }
        }
        return vals
    }
    
    /**
     初始化配置
     */
    private func initConfig(options:Dictionary<String,String>?) -> GKPhotoBrowserConfigure {
       var configure = GKPhotoBrowserConfigure.default()
        configure!.showStyle = .zoom
        configure!.hideStyle = .zoomScale
        configure!.loadStyle = .indeterminateMask
        configure!.maxZoomScale = 20;
        configure!.doubleZoomScale = 2.0;
        configure!.isShowPlayImage = true;
        configure?.isSingleTapDisabled = true;
        return configure!;
    }
    
    
    
    func photoBrowser(_ browser: GKPhotoBrowser!, doubleTapWith index: Int) {
        
    }
    
    func photoBrowser(_ browser: GKPhotoBrowser!, longPressWith index: Int) {
        
    }
    func photoBrowser(_ browser: GKPhotoBrowser!, singleTapWith index: Int) {
        let photo = browser.curPhoto
        let photoView = browser.curPhotoView;
        
        if(photo.isVideo){
            if(photoView.player?.isPlaying == true){
                photoView.player?.gk_pause();
                photoView.playBtn.isHidden = false;
            }else{
                photoView.player?.gk_pause();
                photoView.playBtn.isHidden = true;
            }
        }else{
            browser.dismiss();
        }
    }
    
    func photoBrowser(_ browser: GKPhotoBrowser!, didDisappearAt index: Int) {
        self.browser = nil;
    }
}
