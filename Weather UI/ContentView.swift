//
//  ContentView.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 21/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showView: Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    init(){
        self.forecastViewModel = ForecastViewModel()
    }
    
    var body: some View {
        ZStack(){
            BackSplash()
            VStack {
                TopView(showField: self.showView, forecastViewModel: forecastViewModel)
                
                MidView(forecastViewModel: forecastViewModel)
            }
            
            VStack(alignment: .center, spacing: 8){
                
                Image(systemName: Helper().showWeatherIcon(item: self.forecastViewModel.weatherForecast))
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.top,100)
                
                
                CurrentTempView(forecasViewModel: forecastViewModel)
                
                Text("7-Day Weather Forecast")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.all,20)
                
                
                
                ScrollView (.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(forecastViewModel.getForecastList(), id: \.dt){
                            forecast in
                            
                            BottonScrollForecast(forecastData: forecast)
                            
                        }
                    }
                }
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
