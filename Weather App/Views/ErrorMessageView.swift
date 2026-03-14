//
//  ErrorMessageView.swift
//  Weather App
//
//  Created by Ojasvi Hardas on 14/03/26.
//

import SwiftUI

struct ErrorMessageView: View {
    
    private let friendlyErrorMessage: [String] = [
        "No connection",
        "No data available",
        "Something went wrong",
        "Please try again later"
    ]
    var message: String{
        friendlyErrorMessage.randomElement() ?? ""
    }
    
    
    var body: some View {
        VStack(spacing: 14){
            Image(systemName: "cloud.drizzle.fill")
                .font(.largeTitle)
            Text("Weather Unavailabe")
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
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
            .foregroundStyle(.white)
           
            
    }
}

#Preview {
    ErrorMessageView()
}
