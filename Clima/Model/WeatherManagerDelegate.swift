//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Tomasz Jaeschke on 16/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeathe(_ weatherManager: WeatherManager, _ weatherModel: WeatherModel)
    func didFailWithError(_ error: Error)
}
