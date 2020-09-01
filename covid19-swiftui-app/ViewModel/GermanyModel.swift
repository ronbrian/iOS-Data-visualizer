//
//  GermanyModel.swift
//  covid19-swiftui-app
//
//  Created by Ron Machoka on 01.09.20.
//  Copyright © 2020 Ron Machoka. All rights reserved.
//

import Foundation
import Combine
import UIKit
import Covid19SwiftAPI

class GermanyModel: ObservableObject {

    init() {
        loadData()
    }

    @Published var barChartData = BarChartData(barChartDataPoints: [BarChartDataPoint]())

    private var data: AnyCancellable? = nil

    public func loadData() {
        self.data = Covid19API.latestCovid19DataGermany()
            .sink(receiveCompletion: { _ in }, receiveValue: {
                let sortedStatesByCaseNumbers = $0.states.sorted { $0.count > $1.count }
                self.barChartData = self.convertToBarChartData(countries: sortedStatesByCaseNumbers)
            })
    }

    private func convertToBarChartData(countries: [State]) -> BarChartData {
        var dataPoints = [BarChartDataPoint]()
        countries.forEach {
            dataPoints.append((BarChartDataPoint(valueName: $0.name, valueNumber: CGFloat($0.count))))
        }
        return BarChartData(barChartDataPoints: dataPoints)
    }
}
