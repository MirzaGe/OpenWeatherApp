//
//  Weather.swift
//  OpenWeatherApp
//
//  Created by sherry on 25/07/2021.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
    
}
