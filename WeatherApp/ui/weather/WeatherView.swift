//
//  ContentView.swift
//  WeatherApp
//
//  Created by Isaac on 25/6/24.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text(weatherViewModel.weatherModel.city)
                    .foregroundColor(.white)
                    .font(.system(size: 70))
                Text(weatherViewModel.weatherModel.description)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                
                HStack {
                    if let url = weatherViewModel.weatherModel.iconURL {
                        AsyncImage(url: url) { image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Text(weatherViewModel.weatherModel.currentTemperature)
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                }
                .padding(.top, -20)
                
                HStack(spacing: 14) {
                    Label(weatherViewModel.weatherModel.maxTemperature, systemImage: "thermometer.sun.fill")
                    Label(weatherViewModel.weatherModel.minTemperature, systemImage: "thermometer.snowflake")
                }
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
                
                Divider().foregroundColor(.white)
                    .padding()
                
                HStack(spacing: 32) {
                    VStack {
                        Image(systemName: "sunrise.fill")
                            .symbolRenderingMode(.multicolor)
                            .padding(.bottom, 6)
                        Text(weatherViewModel.weatherModel.sunrise, style: .time)
                    }
                    
                    VStack {
                        Image(systemName: "sunset.fill")
                            .symbolRenderingMode(.multicolor)
                            .padding(.bottom, 6)
                        Text(weatherViewModel.weatherModel.sunset, style: .time)
                    }
                }.foregroundColor(.white)
                
                Divider().foregroundColor(.white)
                    .padding()
                
                Label(weatherViewModel.weatherModel.humidity, systemImage: "humidity.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                
                Spacer()

            }
            .padding(.top, 32)
        }
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        .task {
            await weatherViewModel.getWeather(city: "Sevilla")
        }
    }
}


#Preview {
    WeatherView()
}
