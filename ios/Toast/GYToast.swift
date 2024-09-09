//
//  GYToast.swift
//  react-native-gy
//
//  Created by 古耀 on 2024/9/7.
//

import Toaster

@objc(GYToast)
class GYToast: NSObject {
    
    override init() {
        ToastView.appearance().font = UIFont.systemFont(ofSize: 14);
        ToastView.appearance().maxWidthRatio = 0.8;
    }
    
    @objc(show:duration:)
    func show(msg:NSString,duration:Int) -> Void {
        DispatchQueue.main.async {
            ToastCenter.default.cancelAll()
            Toast(text:msg as String,duration: (duration == 0) ? 2 : 3.5).show();
        }
    }

}
