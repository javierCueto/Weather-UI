//
//  ContentView.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 21/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    init(){
        self.forecastViewModel = ForecastViewModel()
    }
    
    var body: some View {
        ZStack(){
            BackSplash()
            TextField("Enter city name", text: self.$forecastViewModel.cityName){
                self.forecastViewModel.searCity()
            }
            
            Text("City \(forecastViewModel.cityName) ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
