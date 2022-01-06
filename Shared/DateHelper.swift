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
    
    func daysAgo(_ days: Int) -> Date {
        return today.advanced(by: -secondsInADay * Double(days))
    }
}

extension Date {
    var covid19WidgetShortDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
    
    var covid19WidgetDateTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: self)
    }
    
    var covid19ApiDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self) + "T00:00:00Z"
    }
}
