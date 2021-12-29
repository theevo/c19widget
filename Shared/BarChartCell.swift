//
//  BarChartCell.swift
//  c19widget
//
//  Created by Theo Vora on 12/29/21.
//

import SwiftUI

struct BarChartCell: View {
    var value: Double
    var barColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(barColor)
            .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
    }
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        BarChartCell(value: 3800, barColor: .blue)
            .previewLayout(.sizeThatFits)
    }
}
