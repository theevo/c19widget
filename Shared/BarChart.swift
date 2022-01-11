//
//  BarChart.swift
//  c19widget
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct BarChart: View {
    var title: String
    var city: String
    var barColor: Color
    var data: [ChartData]
    
    var dataMax: Double {
        let dataValues = data.map { $0.value }
        return dataValues.max() ?? 0
    }
    
    @State private var deviceOrientation: UIDeviceOrientation = .unknown
    {
        didSet {
            switch deviceOrientation {
            case .landscapeLeft, .landscapeRight:
                maxHeightRatio = 0.85
            default:
                maxHeightRatio = 0.9
            }
        }
    }
    
    @State private var maxHeightRatio: CGFloat = 0.9
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
                .font(.largeTitle)
            Spacer()
            Text(city)
            Spacer()
            GeometryReader { geometry in
                let fullBarHeight = Double(geometry.size.height * maxHeightRatio)
                
                VStack {
                    HStack {
                        ForEach(0..<data.count, id: \.self) { i in
                            BarChartCell(label: data[i].label,
                                         value: data[i].value,
                                         max: dataMax,
                                         fullBarHeight: fullBarHeight,
                                         barColor: barColor)
                        }
                    }
                    
                }
            }
        }
        .padding()
        .onRotate { newOrientation in
            deviceOrientation = newOrientation
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(title: "Confirmed COVID-19 cases",
                 city: "Salt Lake City, Utah",
                 barColor: .blue,
                 data: chartDataSet)
    }
}
