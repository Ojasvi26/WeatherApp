//
//  WeatherResponse.swift
//  Weather App
//
//  Created by Ojasvi Hardas on 13/03/26.
//


import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    
    let tempC: Double
    let condition: Condition
    let feelslikeC: Double
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case feelslikeC = "feelslike_c"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let country: String
    
    enum CodingKeys: String, CodingKey {
        case name, country
    }
}
