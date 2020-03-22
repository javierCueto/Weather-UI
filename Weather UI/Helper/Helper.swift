//
//  Helper.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 22/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import Foundation

struct Helper {
    func timeConverter (timeStamp: Int, isDay: Bool)-> String {
        let unixTimeStamp = timeStamp
        
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimeStamp))
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        
        dateFormatter.locale = NSLocale.current
        
        dateFormatter.dateFormat = isDay ? "EEEE" : "EEEE, MMM d, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    
    func showWeatherIcon(item: ForecastWeatherResponse) -> String {
        let main = item.list?.first?.weather![0].main
        
        switch main {
        case "Ash":
            return "cloud.hail"
        case "Clear":
            return "sun.max"
        case "Clouds":
            return "cloud.sun.fill"
        case "Drizzle":
            return "cloud.drizzle.fill"
        case "Dust":
            return "sun.dust.fill"
        case "Fog":
            return "cloud.fog.fill"
        case "Haze":
            return "sun.haze.fill"
        case "Mist":
            return "cloud.drizzle"
        case "Rain":
            return "cloud.rain.fill"
        case "Sand":
            return "cloud.hail"
        case "Snow":
            return "cloud.snow.fill"
        case "Squall":
            return "cloud.hail"
        case "Thunderstorm":
            return "cloud.bol.fill"
            
        default:
            return "clear"
        }
    }
    
    
    func showWeatherIcon(item: MainForescastParams) -> String {
        let main = item.weather![0].main
        
        switch main {
        case "Ash":
            return "cloud.hail"
        case "Clear":
            return "sun.max"
        case "Clouds":
            return "cloud.sun.fill"
        case "Drizzle":
            return "cloud.drizzle.fill"
        case "Dust":
            return "sun.dust.fill"
        case "Fog":
            return "cloud.fog.fill"
        case "Haze":
            return "sun.haze.fill"
        case "Mist":
            return "cloud.drizzle"
        case "Rain":
            return "cloud.rain.fill"
        case "Sand":
            return "cloud.hail"
        case "Snow":
            return "cloud.snow.fill"
        case "Squall":
            return "cloud.hail"
        case "Thunderstorm":
            return "cloud.bol.fill"
            
        default:
            return "clear"
        }
    }
}
