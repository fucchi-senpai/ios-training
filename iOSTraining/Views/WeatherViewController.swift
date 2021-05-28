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
        let weather = WeatherModel.fetchWeather()
        self.weatherImageView.set(weather: weather)
    }
    
}
