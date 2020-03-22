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
                CurrentTempView(forecasViewModel: forecastViewModel)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
