//
//  WeatherViewController.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/26.
//

import UIKit

protocol WeatherViewDelegate: AnyObject {
    /// 天候情報をAPIから受け取る
    func loadWeather()
}

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    weak var delegate: WeatherViewDelegate?
    private let weatherModel: WeatherModelProtocol
    
    init(weatherModel: WeatherModelProtocol) {
        self.weatherModel = weatherModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Logging.log(message: #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logging.log(message: "start viewDidLoad")
        initView()
        self.delegate = self
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil, using: { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.loadWeather()
        })
    }
    
    @IBAction private func onClickReloadButton(_ sender: Any) {
        self.delegate?.loadWeather()
    }
    
    @IBAction private func onClickCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
    
    private func refreshWeatherView(_ result: Result) {
        Logging.log(message: #function)
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
    
}

extension WeatherViewController: WeatherViewDelegate {
    /// 天候情報をAPIから受け取る
    func loadWeather() {
        self.activityIndicator.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            let parameter = Parameter(area: Const.Place.tokyo, date: DateUtil.formatDate(format: Const.Date.yyyyMmDdTHhMmSsZZZZZ))
            guard let jsonString = JsonUtil.jsonEncode(param: parameter) else { return }
            self.weatherModel.fetchWeather(jsonString) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.refreshWeatherView(result)
                }
            }
        }
    }
}
