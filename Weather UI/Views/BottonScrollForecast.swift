//
//  BottonScrollForecast.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 22/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import SwiftUI

struct BottonScrollForecast: View {
    let forecastData : MainForescastParams
    @State var icon = "sun.max"
    var body: some View {
        ZStack{
            ZStack(alignment: .topLeading){
                Text(String(Helper().timeConverter(timeStamp: forecastData.dt!, isDay: true)))
                    .foregroundColor(Color("icons"))
            }.offset(y: -75)
            
            HStack{
                
                Image(systemName: Helper().showWeatherIcon(item: forecastData))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("secondary"))
                    .background(RoundedRectangle(cornerRadius: 60).frame(width: 80, height: 80).foregroundColor(Color("gradient2")))
                    .padding(.all, 20)

                
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(String(format: "%.0f", (forecastData.temp?.min)!) + "C")
                         .foregroundColor(.gray)
                        Image(systemName: "arrow.down")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                    
                    
                    HStack{
                        Text(String(format: "%.0f", (forecastData.temp?.max)!) + "C")
                         .foregroundColor(.gray)
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Hum \(String((forecastData.humidity)!)) %")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    Text("Wind \(String(format: "%.1f", (forecastData.speed)!)) min/h")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                
            }
        }.frame(width: 220, height: 220)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.leading,15)
        
    }
}

