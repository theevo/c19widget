//
//  LocationManagable.swift
//  c19widget
//
//  Created by Theo Vora on 1/13/22.
//

import Foundation
import CoreLocation

public protocol LocationManagable {
    var didUserAuthorize: Bool { get }
    var currentPlacemark: Placemarkable? { get }
    var currentPlacemarkPublished: Published<Placemarkable?> { get }
    var currentPlacemarkPublisher: Published<Placemarkable?>.Publisher { get }
    func requestAuthorization()
}
