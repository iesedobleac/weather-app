//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Isaac on 26/6/24.
//

// GET https://api.openweathermap.org/data/2.5/weather?q=sevilla&appid=823b34ed68b28480ad3e196ba654c3eb&units=metric&lang=es

import Foundation

final class WeatherViewModel : ObservableObject {
    
    @Published var weatherModel: WeatherModel = .empty
    private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=823b34ed68b28480ad3e196ba654c3eb&units=metric&lang=es")!
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
