//
//  GYCore.swift
//  react-native-gy
//
//  Created by 古耀 on 2024/9/7.
//

import UIKit

class GYCore: NSObject {
    /// keywinow
    public static func keyWindow() -> UIWindow {
        let window: UIWindow
        if #available(iOS 15, *) {
            window = (UIApplication.shared.connectedScenes
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows.first)!
        } else {
            window = UIApplication.shared.windows.first!
        }
        return window
    }

    /// 顶部VC
    public static func topVC() -> UIViewController {
        var topVC: UIViewController
        topVC = GYCore._resultVC(VC: GYCore.keyWindow().rootViewController)!
        return topVC
    }

    private static func _resultVC(VC: UIViewController?) -> UIViewController? {
        var resultVC: UIViewController? = VC
        if VC?.isKind(of: UINavigationController.self) == true {
            resultVC = _resultVC(VC: (VC as! UINavigationController).topViewController)
        } else if VC?.isKind(of: UITabBarController.self) == true {
            resultVC = _resultVC(VC: (VC as! UITabBarController).selectedViewController)
        } else if VC?.presentedViewController != nil {
            resultVC = _resultVC(VC: VC?.presentedViewController)
        }
        return resultVC
    }
}
