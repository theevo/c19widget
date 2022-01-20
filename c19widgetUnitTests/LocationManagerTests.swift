//
//  LocationManagerTests.swift
//  c19widgetUnitTests
//
//  Created by Theo Vora on 1/12/22.
//

import XCTest
import CoreLocation
@testable import c19widget

class LocationManagerTests: XCTestCase {
    
//    var sut: UserLocationService!
    var locationManager: LocationManagable!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        locationManager = LocationManagerMock()
//        sut = UserLocationService(locationProvider)
    }
    
    override func tearDownWithError() throws {
//        sut = nil
        locationManager = nil
        try super.tearDownWithError()
    }
    
    func testNYCCoordinateReturnsNewYorkCounty() async throws {
        // given
        let nycCoordinate = CLLocation(latitude: 40.748441, longitude: -73.985664)
        let nyCounty = "New York County"
        
        // when
        let sut = await nycCoordinate.getPlacemark()!.countyCounty
        
        // then
        XCTAssertEqual(sut, nyCounty)
    }
    
    func testSFCoordinateReturnsSFCounty() async throws {
        // given
        let sfCoordinate = CLLocation(latitude: 37.790693, longitude: -122.405605)
        let sfCounty = "San Francisco County"
        
        // when
        let sut = await sfCoordinate.getPlacemark()!.countyCounty
        
        // then
        XCTAssertEqual(sut, sfCounty)
    }
    
    func testRequestAuthorization() {
        // given
        let sut = locationManager
        
        // when
        sut?.requestAuthorization()
        
        // then
        XCTAssertTrue(sut!.userDidAuthorize)
    }
    
    func testGetLocation() {
        // given
        let sut = locationManager
        
        // when
        sut?.getLocation()
        let subject = sut?.currentPlacemark?.countyCommaState
        
        // then
        XCTAssertEqual(subject, "San Francisco County, CA")
    }

}
