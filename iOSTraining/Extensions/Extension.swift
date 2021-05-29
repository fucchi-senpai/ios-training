//
//  Extension.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/27.
//

import UIKit

extension UIImageView {
    
    /// 引数で受け取った値を元に対応する天候の画像を設定する。
    /// - Parameter weather: 天候
    func set(weather: String) {
        var imageColor = UIColor()
        switch weather {
        case Weather.sunny.rawValue:
            imageColor = .red
        case Weather.cloudy.rawValue:
            imageColor = .gray
        case Weather.rainy.rawValue:
            imageColor = .blue
        default:
            imageColor = .clear
            break
        }
        self.image = UIImage(named: "icon_\(weather)")?.withRenderingMode(.alwaysTemplate)
        self.tintColor = imageColor
        self.backgroundColor = .none
    }
}
