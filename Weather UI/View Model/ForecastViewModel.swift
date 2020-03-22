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
    var cityName: String = "Guadalajara"
    
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
    
    var weatherDescription: String {
        if let description = self.weatherForecast.list?.first?.weather?.first?.description{
            
            let formattedDesc = description.capitalized(with: .current)
            
            return formattedDesc
            
        }else{
            return ""
        }
    }
    
    var windSpeed: String {
        if let wind = self.weatherForecast.list?.first?.speed {
            let formattedWindSpeed = String(format: "%.1f", (wind))
            return formattedWindSpeed + "mi/h"
        }else{
            return ""
        }
    }
    
    
    var humidity: String {
        if let hum = self.weatherForecast.list?.first?.humidity{
            let formattedHum = String(hum)
            return formattedHum + " %"
        }else{
            return ""
        }
    }
    
    var maxTemp: String {
        if let max = self.weatherForecast.list?.first?.temp?.max{
            let formattedMaxTemp = String(format: "%.0f", (max))
            return formattedMaxTemp + " C"
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
    
    var temperature : String {
        if let temp = self.weatherForecast.list?.first?.temp?.day {
            let formattedString = String(format: "%.0f", temp)
            return formattedString + " C"
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

