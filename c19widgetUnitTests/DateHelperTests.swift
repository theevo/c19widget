//
//  DateHelperTests.swift
//  c19widgetUnitTests
//
//  Created by Theo Vora on 1/11/22.
//

import XCTest
@testable import c19widget

class DateHelperTests: XCTestCase {

    var dateFormatter = DateFormatter()
    let midnightTime: String = "T00:00:00Z"
    
    override func setUpWithError() throws {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH':'mm':'ssZ"
    }

    override func tearDownWithError() throws {
        dateFormatter = DateFormatter()
    }
    
    func testYesterday() {
        // given
        let jan6 = dateFormatter.date(from: "2022-01-06" + midnightTime)!
        let sut = DateHelper(startDate: jan6).yesterday
        
        // when
        let jan5 = dateFormatter.date(from: "2022-01-05" + midnightTime)!
        
        // then
        XCTAssertEqual(sut, jan5, "The day before Jan 6 should be Jan 5")
    }
    
    func testSevenBeforeYesterday() {
        // given
        let jan6 = dateFormatter.date(from: "2022-01-06" + midnightTime)!
        let sut = DateHelper(startDate: jan6).sevenDaysBeforeYesterday
        
        // when
        let dec30 = dateFormatter.date(from: "2021-12-30" + midnightTime)!
        
        // then
        XCTAssertEqual(sut, dec30, "Seven days before the yesterday of Jan 6 should be Dec 30")
    }
}
