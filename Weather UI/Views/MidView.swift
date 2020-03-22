//
//  MidView.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 22/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import SwiftUI

struct MidView: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
    var body: some View {
        VStack {
            VStack {
                Text("\(self.forecastViewModel.currentCity), \(self.forecastViewModel.currentCountry)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                
                
                Text("\(self.forecastViewModel.weatherDay)")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.light)
                
                
            }
        }
    }
}
