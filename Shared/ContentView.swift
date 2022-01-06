//
//  ContentView.swift
//  Shared
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var location: String = "Salt Lake City, Utah"
    @State private var c19Data: [ChartData] = chartDataSet
    @State private var updatedTime: String = ""
    
    var body: some View {
        VStack {
            BarChart(title: "Confirmed COVID-19 cases",
                 city: location,
                 barColor: .blue,
                 data: c19Data)
            Text(updatedTime)
                .font(.caption2)
        }
        .task {
            await loadData()
        }
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
