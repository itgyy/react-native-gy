//
//  GYToast.swift
//  react-native-gy
//
//  Created by 古耀 on 2024/9/7.
//

import Toaster

@objc(GYToast)
class GYToast: NSObject {
    
    @objc(show:duration:)
    func show(msg:NSString,duration:CGFloat) -> Void {
        DispatchQueue.main.async {
            ToastCenter.default.cancelAll()
            Toast(text:msg as String,duration: duration).show();
        }
    }

}
