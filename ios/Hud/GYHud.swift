//
//  GYHud.swift
//  react-native-gy
//
//  Created by 古耀 on 2024/9/7.
//

import Foundation

@objc(GYHud)
class GYHud: NSObject {
    override init() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.setMinimumSize(CGSizeMake(120, 120))
    }

    @objc(show)
    func show() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }

    @objc(showStatus:)
    func showStatus(status: String) {
        DispatchQueue.main.async {
            SVProgressHUD.show(withStatus: status)
        }
    }

    @objc(dismiss)
    func dismiss() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
