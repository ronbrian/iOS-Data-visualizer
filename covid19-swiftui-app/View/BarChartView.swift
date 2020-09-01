//
//  BarChartView.swift
//  covid19-swiftui-app
//
//  Created by BBruch on 28.08.20.
//  Copyright © 2020 Benjamin Bruch. All rights reserved.
//

import SwiftUI

struct BarChartView: View {
    
    var chartTitle: String
    var barColor: Color
    var barChartData: BarChartData
    var barHeight: CGFloat = 15
    
    var body: some View {
        ScrollView {
            VStack {
                Text(self.chartTitle)
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                HStack(alignment: .center, spacing: 20) {
                    LegendView(barChartData: self.barChartData.barChartDataPoints, barHeight: self.barHeight)
                    Divider()
                    BarsView(barColor: barColor, barChartData: self.barChartData.barChartDataPoints, barHeight: barHeight)
                }.frame(height: (barHeight+15) * CGFloat(barChartData.barChartDataPoints.count), alignment: .center)
                    .padding()
            }
        }
    }
    
    struct BarChartView_Previews: PreviewProvider {
        static var previews: some View {
            BarChartView(chartTitle: "Covid World Leading", barColor: .blue, barChartData: BarChartData(barChartDataPoints: [BarChartDataPoint(valueName: "DE", valueNumber: 10), BarChartDataPoint(valueName: "USA", valueNumber: 50)]))
        }
    }
}

struct BarsView: View {
    
    var barColor = Color.blue
    var barChartData: [BarChartDataPoint]
    var barHeight: CGFloat
    var maxWidth: CGFloat {
        barChartData.map { $0.valueNumber }.max() ?? 0
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 15){
                ForEach(self.barChartData, id: \.self) { dataPoint in
                    BarView(barColor: self.barColor, valueNumber: dataPoint.valueNumber, height: self.barHeight, maxWidth: self.maxWidth, containerWidth: geometry.size.width)
                }
            }
        }
    }
}

struct BarView: View {
    
    var barColor: Color
    var valueNumber: CGFloat = 0
    var height: CGFloat
    var maxWidth: CGFloat = 0
    var containerWidth: CGFloat = 0
    
    var body: some View {
        Capsule()
            .fill(self.barColor)
            .frame(width: CGFloat(self.valueNumber) / CGFloat(self.maxWidth) * (containerWidth), height: height)
    }
}


struct BarChartData {
    let barChartDataPoints: [BarChartDataPoint]
}

struct BarChartDataPoint: Hashable {
    let valueName: String
    let valueNumber: CGFloat
}



struct LegendView: View {
    
    var barChartData: [BarChartDataPoint]
    var barHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 15) {
            ForEach(self.barChartData, id: \.self) { dataPoint in
                Text(dataPoint.valueName)
                    .font(.system(size: self.barHeight))
                    .fontWeight(.medium)
                    .frame(height: self.barHeight)
                    .lineLimit(1)
            }
        }
    }
}
