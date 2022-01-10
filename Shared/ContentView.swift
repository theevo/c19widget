//
//  ContentView.swift
//  Shared
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = BarChartViewModel()
    
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
