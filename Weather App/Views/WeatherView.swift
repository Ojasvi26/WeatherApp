//
//  WeatherView.swift
//  Weather App
//
//  Created by Ojasvi Hardas on 13/03/26.
//

import SwiftUI

struct WeatherView: View {
    @State private var vm = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                TextField("Enter City Name", text: $vm.city)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                Button {
                    Task{
                        await vm.fetchData()
                    }
                } label: {
                    Label("Get the Weather",
                          systemImage: "cloud.sun.fill")
                    
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                if vm.isLoading{
                    ProgressView("Fetching Weather...")
                } else if let weather = vm.weather{
                    WeatherCard(weather: weather)
                } else if let error = vm.errorMessage{
                    Text(error)
                        .foregroundStyle(.red)
                }
                Spacer()
                
            }.navigationTitle("Weather App")
            .background(
                    LinearGradient(
                        colors: [.teal.opacity(0.4), .indigo.opacity(0.1), .blue.opacity(0.4)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        }
        
    }
}

#Preview {
    WeatherView()
}
