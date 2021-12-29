//
//  BarChartCell.swift
//  c19widget
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct BarChartCell: View {
    var value: Double
    var max: Double
    var fullBarHeight: Double
    var barColor: Color
    
    var height: Double {
        let maxHeight: Double = 0.9
        
        if max != 0 {
            return Double(value / max * fullBarHeight)
        } else {
            return 0.0
        }
    }
    
    var body: some View {
        GeometryReader { geoReader in
            let textWidth = geoReader.size.width * 0.80
            
            VStack {
                Spacer()
                ZStack {
                    VStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 5)
                            .fill(barColor)
//                            .scaleEffect(CGSize(width: 1, height: height), anchor: .bottom)
                            .frame(height: height, alignment: .trailing)
                            .overlay(
                                Text("\(value, specifier: "%.0f")")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(width: textWidth)
                                    .offset(y:10),
                                alignment: .top
                            )
                    }
                    VStack {
                        Spacer()
                        
                    }
                }
            }
        }
    }
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        let deviceHeight = Double(UIScreen.main.bounds.size.height * 0.8)
        BarChartCell(value: 3800,
                     max: 4000,
                     fullBarHeight: deviceHeight,
                     barColor: .blue)
            .previewLayout(.sizeThatFits)
    }
}
