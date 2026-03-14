//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Ojasvi Hardas on 13/03/26.
//

import Foundation

@Observable
class WeatherViewModel{
    var city: String = ""
    var weather: WeatherResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let apiKey = "9b87de9d5205409ab4562016261303"
    
    private func fetchWeatherData(for city: String) async throws -> WeatherResponse{
        
        // Build URL
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(city)&aqi=no"
        guard let url = URL(string: urlString) else {
            throw WeatherError.invalidURL
        }
        
        // fetch data fron URL
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Validate response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherError.unknown
        }
        guard httpResponse.statusCode == 200 else {
            throw WeatherError.requestFailed(statusCode: httpResponse.statusCode)
        }
        
        // decode Model
        do {
            return try JSONDecoder().decode(WeatherResponse.self, from: data)
        }catch{
            throw WeatherError.decoingFailed
        }
        
        
//        return .init(
//            location: .init(name: "Londaon", country: "England"),
//            current: .init(
//                tempC: 30,
//                condition: .init(text: "Good Condition", icon: "Icon Name"),
//                feelslikeC: 32.5
//            )
//        )
    }
    
    @MainActor
    func fetchData() async {
        do{
            weather = try await fetchWeatherData(for: city)
            errorMessage = "Successfully fetched weather details"
        }catch{
            if let weatherError = error as? WeatherError{
                errorMessage = weatherError.localizedDescription
            }else{
                errorMessage = "unexpected error: \(error.localizedDescription)"
            }
        }
    }
    
}




