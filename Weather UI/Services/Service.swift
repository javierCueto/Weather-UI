//
//  Service.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 21/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import Foundation

class Services{
    let apiID = "ed60fcfbd110ee65c7150605ea8aceea"
    
    
    func getWeatherData(city: String, completion: @escaping
        (ForecastWeatherResponse?)->()) {
        
        print("Creando url")
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&units=metric&appid=\(apiID)") else{
                completion(nil)
                return
        }
        print("Saliendo del url= \(url)")
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
            
            print("\(weatherResponse)")
            if let weatherResponse = weatherResponse{
                completion(weatherResponse)
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
