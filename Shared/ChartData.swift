//
//  ChartData.swift
//  c19widget
//
//  Created by Theo Vora on 12/29/21.
//

import Foundation

struct ChartData {
    var label: String
    var value: Double
}

let chartDataSet = [
    ChartData(label: "Mon", value: 221014),
    ChartData(label: "Tue", value: 221014),
    ChartData(label: "Wed", value: 221014),
    ChartData(label: "Thu", value: 221014),
    ChartData(label: "Fri", value: 222912),
    ChartData(label: "Sat", value: 223678),
    ChartData(label: "Sun", value: 225040)
]

// TODO: Make the bars more dramatic by eliminating first 2 significant digits
//
//let chartDataSet = [
//    ChartData(label: "Mon", value: 1014),
//    ChartData(label: "Tue", value: 1014),
//    ChartData(label: "Wed", value: 1014),
//    ChartData(label: "Thu", value: 1014),
//    ChartData(label: "Fri", value: 2912),
//    ChartData(label: "Sat", value: 3678),
//    ChartData(label: "Sun", value: 5040)
//]
