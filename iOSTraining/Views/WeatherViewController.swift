//
//  WeatherViewController.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/26.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        self.weatherImageView.set(weather: Weahter.sunny.rawValue)
    }
    
    @IBAction private func onClickReloadButton(_ sender: Any) {
        let date = DateUtil.formatDate(format: Const.Date.yyyyMmDdTHhMmSsZZZZZ)
        guard let request = JsonUtil.jsonEncode(param: Parameter(area: Const.Place.tokyo, date: date)) else { return }
        if let response = WeatherModel.fetchWeather(request) {
            guard let weatherData = JsonUtil.jsonDecode(jsonString: response) else { return }
            Logging.log(message: "Response: \(weatherData)")
            self.weatherImageView.set(weather: weatherData.weather)
        } else {
            let content = AlertContent(title: Const.Alert.title, message: Const.Alert.message, action: UIAlertAction(title: Const.Alert.button_title, style: .default, handler: nil))
            AlertUtil.present(vc: self, content: content)
        }
    }
    
}
