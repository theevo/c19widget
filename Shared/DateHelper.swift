//
//  DateHelper.swift
//  c19widget
//
//  Created by Theo Vora on 12/30/21.
//

import Foundation

struct DateHelper {
    private let today = Date()
    private let secondsInADay: Double = 24 * 60 * 60
    
    var yesterday: Date {
        today.advanced(by: -secondsInADay)
    }
    
    var sevenDaysAgo: Date {
        today.advanced(by: -secondsInADay * 7)
    }
}

extension Date {
    func covid19ApiString() -> String {
        // https://api.covid19api.com/country/south-africa/status/confirmed?from=2020-03-01T00:00:00Z&to=2020-04-01T00:00:00Z
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self) + "T00:00:00Z"
    }
}
