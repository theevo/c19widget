//
//  Covid19APIURLBuildable.swift
//  c19widgetUnitTests
//
//  Created by Theo Vora on 2/8/22.
//

import Foundation

protocol Covid19APIURLBuildable {
    var state: String { get set }
    var url: URL { get }
}
