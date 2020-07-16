//
//  WeatherManager.swift
//  Clima
//
//  Created by Tomasz Jaeschke on 08/07/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let fetchURL = "\(URL_API)&q=\(cityName)"
        print("\(fetchURL)")
        self.performRequest(urlString: fetchURL)
    }
    
    private func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeathe(self, weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData)
            
            let temp = decodedData.main.temp
            let city = decodedData.name
            let description = decodedData.weather[0].description
            let id = decodedData.weather[0].id
            
            let weather = WeatherModel(temperature: temp, cityName: city, description: description, weatherID: id)
            
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
}
