//
//  CurrentTempView.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 22/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import SwiftUI

struct CurrentTempView: View {
    @ObservedObject var forecasViewModel: ForecastViewModel
    var body: some View {
        VStack{
            HStack {
                Text(self.forecasViewModel.temperature)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
                
                
                Text(self.forecasViewModel.weatherDescription)
                    .foregroundColor(Color("secondary"))
            }
            
            HStack (spacing : 6){
                VStack{
                    Text(self.forecasViewModel.windSpeed)
                        .bold()
                        .foregroundColor(Color("secondary"))
                    
                    
                    Text("Wind")
                        .foregroundColor(Color("secondary"))
                    
                }
                
                
                
                VStack {
                    Text(self.forecasViewModel.humidity)
                        .bold()
                        .foregroundColor(Color("secondary"))
                    Text("Humidity")
                        .foregroundColor(Color("secondary"))
                }
                
                
                VStack {
                    Text(self.forecasViewModel.maxTemp)
                        .bold()
                        .foregroundColor(Color("secondary"))
                    Text("Max")
                        .foregroundColor(Color("secondary"))
                }
            }
            
            
            
            
        }
        
    }
}

