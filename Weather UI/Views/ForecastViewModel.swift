//
//  ForecastViewModel.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 21/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    var weatherService: Services!
    var cityName: String = "Boston"
    
    @Published var weatherForecast = ForecastWeatherResponse()
    
    init(){
        self.weatherService = Services()
    }
    
    
    func searCity(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeatherForecast(by: city)
        }
    }
    
    func fetchWeatherForecast(by city: String){
        self.weatherService.getWeatherData(city: cityName) {
            forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.weatherForecast = forecast
                }
            }
        }
    }
}

