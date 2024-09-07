//
//  GYFile.swift
//  react-native-gy
//
//  Created by 古耀 on 2024/9/7.
//

@objc(GYFile)
class GYFile: NSObject, UIDocumentPickerDelegate {
    /**
     打开系统文件库
     */
    @objc(openSystemFileManager)
    func openSystemFileManager() {
        DispatchQueue.main.async {
            let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.data"], in: .import)
            documentPicker.delegate = self
            // 展示文档选择器
            GYCore.topVC().present(documentPicker, animated: true, completion: nil)
        }
    }

    /// 取消
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
    }

    /// 选中文件
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
    }
}
