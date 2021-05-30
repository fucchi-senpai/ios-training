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
        self.backgroundColor = .clear
    }
}

extension UILabel {
    /// 気温のテキストとフォントを設定する
    /// - Parameter temp: 気温
    func set(temp: Int) {
        self.text = String(temp)
        self.font = .italicSystemFont(ofSize: CGFloat(Const.Label.temp_font_size))
    }
}
