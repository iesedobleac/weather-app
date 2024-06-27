//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Isaac on 27/6/24.
//

import Foundation

struct WeatherModel {
    let city: String
    let weather: String
    let description: String
    let iconURL: URL?
    let currentTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: String
    let sunrise: Date
    let sunset: Date
    
    static let empty: WeatherModel = .init(
        city: "No city",
        weather: "No weather",
        description: "No description",
        iconURL: nil,
        currentTemperature: "0º",
        minTemperature: "0º",
        maxTemperature: "0º",
        humidity: "0%",
        sunrise: .now,
        sunset: .now
    )
}
