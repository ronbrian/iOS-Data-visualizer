//
//  WorldLeadingModel.swift
//  covid19-swiftui-app
//
//  Created by Ron Machoka on 28.08.20.
//  Copyright © 2020 Ron Machoka. All rights reserved.
//

import Foundation
import Combine
import UIKit
import Covid19SwiftAPI

class WorldLeadingModel: ObservableObject {

    init() {
        loadData()
    }

    @Published var barChartData = BarChartData(barChartDataPoints: [BarChartDataPoint]())
    
    private var data: AnyCancellable? = nil

    public func loadData() {
        self.data = Covid19API.summary()
            .sink(receiveCompletion: { _ in }, receiveValue: {
                let sortedCountriesByCaseNumbers = $0.Countries.sorted { $0.TotalConfirmed > $1.TotalConfirmed }
                let worldLeadingByCaseNumbers = Array(sortedCountriesByCaseNumbers.prefix(10))
                var tempArray = [Country]()
                worldLeadingByCaseNumbers.forEach {
                    tempArray.append(Country(id: $0.Slug, countryCode: $0.CountryCode, name: $0.Country, newConfirmed: $0.NewConfirmed, totalConfirmed: $0.TotalConfirmed, newDeaths: $0.NewDeaths, totalDeaths: $0.TotalDeaths, newRecovered: $0.NewRecovered, totalRecovered: $0.TotalRecovered, date: $0.Date))
                }
                self.barChartData = self.convertToBarChartData(countries: tempArray)
            })
    }

    private func convertToBarChartData(countries: [Country]) -> BarChartData {
       
           var dataPoints = [BarChartDataPoint]()
            
           countries.forEach {
            dataPoints.append((BarChartDataPoint(valueName: $0.name, valueNumber: CGFloat($0.totalConfirmed), actualFigures: $0.totalConfirmed)))
           }
           return BarChartData(barChartDataPoints: dataPoints)
       }

    private func getFlag(from countryCode: String) -> String {
    return countryCode
        .unicodeScalars
        .map({ 127397 + $0.value })
        .compactMap(UnicodeScalar.init)
        .map(String.init)
        .joined()
    }
}
