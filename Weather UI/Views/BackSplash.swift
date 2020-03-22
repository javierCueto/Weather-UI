//
//  BackSplash.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 21/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import SwiftUI

struct BackSplash: View {
    var body: some View {
        Rectangle()
        .fill(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color("lightPink")
                        , Color("lightBlue")
                             ]
            ), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackSplash_Previews: PreviewProvider {
    static var previews: some View {
        BackSplash()
    }
}
