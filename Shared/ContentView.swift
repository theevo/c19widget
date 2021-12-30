//
//  ContentView.swift
//  Shared
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            BarChart(title: "Confirmed COVID-19 cases",
                 city: "Salt Lake City, Utah",
                 barColor: .blue,
                 data: chartDataSet)
            Text("Last updated: 12/30/2021 3:10 PM")
                .font(.caption2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
