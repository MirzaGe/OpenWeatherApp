//
//  WeatherService.swift
//  OpenWeatherApp
//
//  Created by sherry on 25/07/2021.
//

import Foundation

class WeatherService {
    func getWeather(city:String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "api.openweathermap.org/data/2.5/weather?id=\(city)&appid=1cafc027aad5bf7a14a016053578cae0")
        else  {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
}
