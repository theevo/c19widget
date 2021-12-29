//
//  BarChart.swift
//  c19widget
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct BarChart: View {
    var title: String
    var barColor: Color
    var data: [ChartData]
    
    @State private var currentValue = ""
    @State private var currentLabel = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
                .font(.largeTitle)
            Spacer()
            Text("Salt Lake City, Utah")
            Spacer()
            Spacer()
            Spacer()
            GeometryReader { geometry in
                VStack {
                    HStack {
                        ForEach(0..<data.count, id: \.self) { i in
                            BarChartCell(value: normalizedValue(index: i), barColor: barColor)
                        }
                    }
                    
                }
            }
        }
        .padding()
    }
    
    func normalizedValue(index: Int) -> Double {
        let maxHeight: Double = 0.9
        
        var allValues: [Double] {
            return data.map { $0.value }
        }
        
        guard let max = allValues.max() else {
            return maxHeight
        }
        
        if max != 0 {
            return Double(data[index].value/Double(max)*maxHeight)
        } else {
            return maxHeight
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(title: "Confirmed COVID-19 cases", barColor: .blue, data: chartDataSet)
    }
}
