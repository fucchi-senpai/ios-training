//
//  Alert.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/29.
//
import UIKit

struct AlertContent {
    var title: String
    var message: String?
    var action: UIAlertAction
}

struct AlertUtil {
    /// AlertController 表示
    /// - Parameters:
    ///   - vc: ViewController
    ///   - content: AlertController 生成のための  title, message, action を持つ
    static func present(vc: UIViewController, content: AlertContent) {
        let alertController = UIAlertController(title: content.title, message: content.message, preferredStyle: .alert)
        alertController.addAction(content.action)
        vc.present(alertController, animated: true, completion: nil)
    }
}
