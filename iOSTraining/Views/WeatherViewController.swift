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
        self.weatherImageView.set(weather: Weather.sunny.rawValue)
    }
    
    @IBAction private func onClickReloadButton(_ sender: Any) {
        let parameter = Parameter(area: Const.Place.tokyo, date: DateUtil.formatDate(format: Const.Date.yyyyMmDdTHhMmSsZZZZZ))
        guard let request = JsonUtil.jsonEncode(param: parameter) else { return }
        
        let weatherData = WeatherModel.fetchWeather(request)
        
        switch weatherData.responseStatus {
        case .success:
            guard let data = weatherData.data else { return }
            self.weatherImageView.set(weather: data.weather)
        case .failure, .notRequest:
            let content = AlertContent(title: Const.Alert.title, message: Const.Alert.message, action: UIAlertAction(title: Const.Alert.button_title, style: .default, handler: nil))
            AlertUtil.present(vc: self, content: content)
        }
    }
    
}
