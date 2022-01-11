//
//  DateHelperTests.swift
//  c19widgetUnitTests
//
//  Created by Theo Vora on 1/11/22.
//

import XCTest
@testable import c19widget

class DateHelperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testYesterday() {
        // given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH':'mm':'ssZ"
        
        let midnightTime = "T00:00:00Z"
        let jan6 = dateFormatter.date(from: "2022-01-06" + midnightTime)!
        let jan5 = dateFormatter.date(from: "2022-01-05" + midnightTime)!
        
        // when
        let dayBeforeJan6 = DateHelper(startDate: jan6).yesterday
        
        // then
        XCTAssertEqual(dayBeforeJan6, jan5)
    }
    
    func testSevenBeforeYesterday() {
        // given
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH':'mm':'ssZ"
        
        let midnightTime = "T00:00:00Z"
        let jan6 = dateFormatter.date(from: "2022-01-06" + midnightTime)!
        let dec30 = dateFormatter.date(from: "2021-12-30" + midnightTime)!
        
        // when
        let sevenDaysPriorToJan6 = DateHelper(startDate: jan6).sevenDaysBeforeYesterday
        
        // then
        XCTAssertEqual(sevenDaysPriorToJan6, dec30)
    }
}
