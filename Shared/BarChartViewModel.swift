//
//  BarChartViewModel.swift
//  c19widget
//
//  Created by Theo Vora on 1/6/22.
//

import Foundation
import Combine
import CoreLocation

public class BarChartViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // TODO: - use private(set) on published vars
    @Published var barChart: [ChartData] = []
    
    // TODO: - this publishes twice: first, empty string. second, the updated location string. NEEEEEED just the second.
    @Published var location: String = ""
    @Published var updatedTime: String = ""
    
    private var locationManager = LocationManager()
    private var cancellable: AnyCancellable?
    
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
        cancellable = locationManager.$currentPlacemark.sink(receiveValue: { [weak self] placemark in
            guard let self = self,
                  let placemark = placemark as? CLPlacemark else { return }
            
            DispatchQueue.main.async {
                self.location = placemark.countyCommaState
                print("%%%*****", #function, "Received location:", self.location)
                self.getData(placemark)
            }
        })
    }
    
    private func getData(_ placemark: CLPlacemark) {
        guard let state = placemark.state else {
                    print(#function, "Error: state is nil")
                    updatedTime = "Error: state is nil"
                    return
                }
        
        Task {
            let api = Covid19APIByCountry(county: placemark.county, state: state)
            
            if let (chartDataArray, timeUpdated) = await api.getData() {
                DispatchQueue.main.async {
                    self.barChart = chartDataArray
                    self.updatedTime = "Last updated: " + timeUpdated.covid19WidgetDateTime
                }
            }
        }
    }
}
