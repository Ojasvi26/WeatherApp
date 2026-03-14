//
//  WeatherError.swift
//  Weather App
//
//  Created by Ojasvi Hardas on 14/03/26.
//
import Foundation

enum WeatherError: LocalizedError{
    
    case invalidURL
    case requestFailed(statusCode: Int)
    case decoingFailed
    case unknown
    
    var errorDescription: String?{
        switch self {
        case .invalidURL:
            "The Provided city name is Invalid"
        case .requestFailed(let statusCode):
            "Request Failed with status code : \(statusCode)"
        case .decoingFailed:
            "Decoding Failed"
        case .unknown:
            "An unkonwn error occured"
        }
        
    }
}
