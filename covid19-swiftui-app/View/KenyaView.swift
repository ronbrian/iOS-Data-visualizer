//
//  KenyaView.swift
//  covid19-swiftui-app
//
//  Created by Ron Machoka on 28.08.20.
//  Copyright © 2020 Ron Machoka. All rights reserved.
//

import SwiftUI



struct KenyaView: View {

    @ObservedObject var viewModel = GermanyModel()

    var body: some View {
        BarChartView(chartTitle: "COVID19 Kenya ", barColor: .blue, barChartData: viewModel.barChartData)
    }
}

struct KenyaView_Previews: PreviewProvider {
    static var previews: some View {
        KenyaView()
    }
}
