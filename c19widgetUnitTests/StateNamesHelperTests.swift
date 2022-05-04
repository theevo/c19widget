//
//  StateNamesHelperTests.swift
//  StateNamesHelperTests
//
//  Created by Theo Vora on 1/11/22.
//

import XCTest
@testable import c19widget

class StateNamesHelperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStateAbbreviationsOf5LargestUSCities() throws {
        // given
        let sut = StateNamesHelper()
        
        // when
        let stateAbbreviations = ["NY", "CA", "IL", "TX", "PA"]
        let stateNames = ["New York", "California", "Illinois", "Texas", "Pennsylvania"]
        
        // then
        for i in 0..<stateAbbreviations.count {
            XCTAssertEqual(sut.stateDictionary[stateAbbreviations[i]], stateNames[i])
        }
    }
    
    func testStateAbbreviationsOfUSTerritories() throws {
        // given
        let sut = StateNamesHelper()
        
        // when
        let stateAbbreviations = ["AS", "GU", "MP", "PR", "VI"]
        let stateNames = ["American Samoa", "Guam", "Northern Mariana Islands", "Puerto Rico", "Virgin Islands"]
        
        // then
        for i in 0..<stateAbbreviations.count {
            XCTAssertEqual(sut.stateDictionary[stateAbbreviations[i]], stateNames[i])
        }
    }
    
    func testStateNamesHelperMatchAPIStates() throws {
        // given
        let sut = StateNamesHelper().stateDictionary
        let sutValues: [String] = Array(sut.values)
        
        // when
        let APIStates = ["Alabama",
                         "Alaska",
                         "American Samoa",
                         "Arizona",
                         "Arkansas",
                         "California",
                         "Colorado",
                         "Connecticut",
                         "Delaware",
//                         "Diamond Princess",
                         "District of Columbia",
                         "Florida",
                         "Georgia",
//                         "Grand Princess",
                         "Guam",
                         "Hawaii",
                         "Idaho",
                         "Illinois",
                         "Indiana",
                         "Iowa",
                         "Kansas",
                         "Kentucky",
                         "Louisiana",
                         "Maine",
                         "Maryland",
                         "Massachusetts",
                         "Michigan",
                         "Minnesota",
                         "Mississippi",
                         "Missouri",
                         "Montana",
                         "Nebraska",
                         "Nevada",
                         "New Hampshire",
                         "New Jersey",
                         "New Mexico",
                         "New York",
                         "North Carolina",
                         "North Dakota",
                         "Northern Mariana Islands",
                         "Ohio",
                         "Oklahoma",
                         "Oregon",
                         "Pennsylvania",
                         "Puerto Rico",
                         "Rhode Island",
                         "South Carolina",
                         "South Dakota",
                         "Tennessee",
                         "Texas",
                         "Utah",
                         "Vermont",
                         "Virgin Islands",
                         "Virginia",
                         "Washington",
                         "West Virginia",
                         "Wisconsin",
                         "Wyoming"]
        
        // then
        for stateName in APIStates {
            XCTAssertTrue(sutValues.contains(stateName))
        }
    }

}
