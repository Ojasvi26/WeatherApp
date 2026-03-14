//
//  WeatherCard.swift
//  Weather App
//
//  Created by Ojasvi Hardas on 13/03/26.
//

import SwiftUI

struct WeatherCard: View {
   
    let weather: WeatherResponse
    var urlString: String{
        "https:\(weather.current.condition.icon)"
    }
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: urlString)){ image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }placeholder: {
                ProgressView()
            }
            
            Text("\(weather.location.name), \(weather.location.country)")
                .font(.title2)
                .bold()
            
            Text("\(weather.current.tempC, specifier: "%.1f")")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            
            Text(weather.current.condition.text)
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))
            
            Text("Feels Like \(weather.current.feelslikeC, specifier: "%.1f")")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.9))

        }.padding()
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [.blue, .teal],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(.rect(cornerRadius:20))
            .shadow(radius: 10)
            .padding()
            
            
    }
}

//#Preview {
//    WeatherCard()
//}
