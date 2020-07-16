//
//  WeatherModel.swift
//  Clima
//
//  Created by Tomasz Jaeschke on 16/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let temperature: Double
    let cityName: String
    let description: String
    let weatherID: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch weatherID {
        case 200...232:
            return "cloud.bold"
        case 300...321:
            return "cloud.rain"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "cloud.snow"
        case 701...771:
            return "cloud.fog"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "thermometer"
        }
    }
}
