//
//  LaunchViewController.swift
//  iOSTraining
//
//  Created by Shota Fuchikami on 2021/05/30.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Logging.log(message: "start viewDidLoad")
        view.backgroundColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Logging.log(message: "start viewDidAppear")
        let weatherVc = WeatherViewController(weatherModel: WeatherModel())
        weatherVc.modalPresentationStyle = .fullScreen
        self.present(weatherVc, animated: true, completion: nil)
    }

}
