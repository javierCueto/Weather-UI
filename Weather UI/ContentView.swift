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
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
