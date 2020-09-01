//
//  GermanyView.swift
//  covid19-swiftui-app
//
//  Created by BBruch on 28.08.20.
//  Copyright © 2020 Benjamin Bruch. All rights reserved.
//

import SwiftUI



struct GermanyView: View {

    @ObservedObject var viewModel = GermanyModel()

    var body: some View {
        BarChartView(chartTitle: "COVID19 Germany", barColor: .blue, barChartData: viewModel.barChartData)
    }
}

struct GermanyView_Previews: PreviewProvider {
    static var previews: some View {
        GermanyView()
    }
}
