//
//  ContentView.swift
//  Shared
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var c19Data: [ChartData] = chartDataSet
    
    var body: some View {
        VStack {
            BarChart(title: "Confirmed COVID-19 cases",
                 city: "Salt Lake City, Utah",
                 barColor: .blue,
                 data: c19Data)
            Text("Last updated: 12/30/2021 3:10 PM")
                .font(.caption2)
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        if let data = await Covid19APIByCountry.getData() {
            
            c19Data = data
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
