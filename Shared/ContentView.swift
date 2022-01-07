//
//  ContentView.swift
//  Shared
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = BarChartViewModel()
    
    @StateObject private var locationManager = LocationManager()
    
    @State private var location: String = "Salt Lake City, Utah"
    @State private var c19Data: [ChartData] = chartDataSet
    @State private var updatedTime: String = ""
    
    var body: some View {
        VStack {
            BarChart(title: "Confirmed COVID-19 cases",
                     city: viewModel.location,
                     barColor: .blue,
                     data: viewModel.barChart)
            Text(viewModel.updatedTime)
                .font(.caption2)
        }
        .onAppear(perform: viewModel.update)
    }
    
    private func loadData() async {
        if let data = await Covid19APIByCountry.getData() {
            
            c19Data = data.0
            location = Covid19APIByCountry.city + ", " + Covid19APIByCountry.province
            updatedTime = "Last updated: " + data.1.covid19WidgetDateTime
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
