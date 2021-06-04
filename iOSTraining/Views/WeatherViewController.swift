//
//  WeatherViewController.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/26.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let weatherModel: WeatherModelProtocol
    
    init(weatherModel: WeatherModelProtocol) {
        self.weatherModel = weatherModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logging.log(message: "start viewDidLoad")
        initView()
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil, using: { _ in
            self.loadWeather()
        })
    }
    
    @IBAction private func onClickReloadButton(_ sender: Any) {
        loadWeather()
    }
    
    @IBAction private func onClickCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadWeather() {
        self.activityIndicator.startAnimating()
        
        DispatchQueue.global(qos: .userInitiated).async {
            let parameter = Parameter(area: Const.Place.tokyo, date: DateUtil.formatDate(format: Const.Date.yyyyMmDdTHhMmSsZZZZZ))
            guard let jsonString = JsonUtil.jsonEncode(param: parameter) else { return }
            self.weatherModel.fetchWeather(jsonString) { result in
                DispatchQueue.main.async {
                    self.refreshWeatherView(result: result)
                }
            }
        }
    }
    
    private func refreshWeatherView(result: Result) {
        switch result.responseStatus {
        case .success:
            guard let weatherData = result.data else { return }
            self.weatherImageView.set(weather: weatherData.weather)
            self.minTempLabel.set(temp: weatherData.minTemp)
            self.maxTempLabel.set(temp: weatherData.maxTemp)
        case .failure, .notRequest:
            let content = AlertContent(title: Const.Alert.title, message: Const.Alert.message, action: UIAlertAction(title: Const.Alert.button_title, style: .default, handler: nil))
            AlertUtil.present(vc: self, content: content)
        }
        self.activityIndicator.stopAnimating()
    }
        
    private func initView() {
        weatherImageView.backgroundColor = .clear
        weatherImageView.accessibilityIdentifier = "weatherImageView"
        minTempLabel.text = Const.Label.invalid_text
        minTempLabel.font = UIFont.systemFont(ofSize: CGFloat(Const.Label.temp_font_size))
        minTempLabel.accessibilityIdentifier = "minTempLabel"
        maxTempLabel.text = Const.Label.invalid_text
        maxTempLabel.font = UIFont.systemFont(ofSize: CGFloat(Const.Label.temp_font_size))
        maxTempLabel.accessibilityIdentifier = "maxTempLabel"
        activityIndicator.style = .gray
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
    }
    
}
