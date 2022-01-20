//
//  LocationManagerMock.swift
//  c19widgetUnitTests
//
//  Created by Theo Vora on 1/13/22.
//

import c19widget
import Combine

struct PlacemarkMock: Placemarkable {
    var countyCommaState: String = "San Francisco County, CA"
}

class LocationManagerMock: LocationManagable {
    @Published var currentPlacemark: Placemarkable?
    var currentPlacemarkPublished: Published<Placemarkable?> { _currentPlacemark }
    var currentPlacemarkPublisher: Published<Placemarkable?>.Publisher { $currentPlacemark }
    
    var userDidAuthorize: Bool = false
    
    func requestAuthorization() {
        userDidAuthorize = true
    }
}

