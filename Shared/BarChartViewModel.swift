//
//  BarChartViewModel.swift
//  c19widget
//
//  Created by Theo Vora on 1/6/22.
//

import Foundation

public class BarChartViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var barChart: [ChartData] = []
    @Published var location: String = ""
    @Published var updatedTime: String = ""
    
    private var apiData: [Covid19APIByCountryResponse] = [] {
        didSet {
            self.barChart = self.apiData.map { response in
                ChartData(label: response.date.covid19WidgetShortDate,
                          value: response.cases)
            }
        }
    }
    
    private var numberOfColumns: Int {
        return 0
    }
    
    //    var maxValue: Double? {
    //        array.map { $0.value }.max()
    //    }
    
    public func update() {
        Task {
            if let (chartDataArray, timeUpdated) = await Covid19APIByCountry.getData() {
                DispatchQueue.main.async {
                    self.barChart = chartDataArray
                    self.location = Covid19APIByCountry.city + ", " + Covid19APIByCountry.province
                    self.updatedTime = "Last updated: " + timeUpdated.covid19WidgetDateTime
                }
            }
        }
    }
}
