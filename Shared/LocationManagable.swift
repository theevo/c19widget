//
//  LocationManagable.swift
//  c19widget
//
//  Created by Theo Vora on 1/13/22.
//

import Foundation
import CoreLocation

public protocol LocationManagable {
    var currentPlacemark: Placemarkable? { get }
    var currentPlacemarkPublished: Published<Placemarkable?> { get }
    var currentPlacemarkPublisher: Published<Placemarkable?>.Publisher { get }
    var userDidAuthorize: Bool { get }
    func requestAuthorization()
    func getLocation()
}
