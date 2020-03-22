//
//  TopView.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 22/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import SwiftUI

let UIWidth = UIScreen.main.bounds.width
let UIHeight = UIScreen.main.bounds.height

struct TopView: View {
    @State  var showField: Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                TextField("Enter city name", text: self.$forecastViewModel.cityName){
                    self.forecastViewModel.searCity()
                    
                }.padding(.all,10)
                    .frame(width : UIWidth - 50, height :50)
                    .background(Color("lightBlue"))
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? 0 : (-UIWidth / 2 - 180))
                    .animation(.spring())
                
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? (UIWidth - 90) : -25)
                    .animation(.spring())
                    .onTapGesture {
                        self.showField.toggle()
                }
                
            }.onAppear(){
                self.fetch()
            }
        }
        
    }
    
    private func fetch(){
        self.forecastViewModel.searCity()
    }
}

