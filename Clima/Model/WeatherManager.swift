//
//  WeatherManager.swift
//  Clima
//
//  Created by Tomasz Jaeschke on 08/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    func fetchWeather(cityName: String){
        let fetchURL = "\(URL_API)&q=\(cityName)"
        print("\(fetchURL)")
    }
}
