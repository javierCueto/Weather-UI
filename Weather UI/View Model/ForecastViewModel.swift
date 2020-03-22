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
    
    var currentCity: String {
        if let city = self.weatherForecast.city?.name {
            return city
        }else{
            return ""
        }
    }
    
    var currentCountry: String{
        if let country = self.weatherForecast.city?.country{
            return country
        }else{
            return ""
        }
    }
    
    var weatherDay: String {
        if let day = self.weatherForecast.list?.first?.dt{
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        }else{
            return ""
        }
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

