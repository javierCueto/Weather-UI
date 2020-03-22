//
//  Helper.swift
//  Weather UI
//
//  Created by José Javier Cueto Mejía on 22/03/20.
//  Copyright © 2020 WH. All rights reserved.
//

import Foundation

struct Helper {
    func timeConverter (timeStamp: Int, isDay: Bool)-> String {
        let unixTimeStamp = timeStamp
        
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimeStamp))
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        
        dateFormatter.locale = NSLocale.current
        
        dateFormatter.dateFormat = isDay ? "EEEE" : "EEEE, MMM d, yyyy"
        
        return dateFormatter.string(from: date)
    }
}
