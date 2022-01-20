//
//  LocationManagerMock.swift
//  c19widgetUnitTests
//
//  Created by Theo Vora on 1/13/22.
//

import c19widget
import Combine

struct PlacemarkMock: Placemarkable {
    var countyCommaState: String = ""
}

class LocationManagerMock: LocationManagable {
    @Published var currentPlacemark: Placemarkable?
    var currentPlacemarkPublished: Published<Placemarkable?> { _currentPlacemark }
    var currentPlacemarkPublisher: Published<Placemarkable?>.Publisher { $currentPlacemark }
    
    var userDidAuthorize: Bool = false
    
    func requestAuthorization() {
        userDidAuthorize = true
    }
    
    func getLocation() {
        let newCountyString = "San Francisco County, CA"
        currentPlacemark = PlacemarkMock(countyCommaState: newCountyString)
    }
}

