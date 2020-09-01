//
//  WorldLeadingView.swift
//  covid19-swiftui-app
//
//  Created by BBruch on 27.08.20.
//  Copyright © 2020 Benjamin Bruch. All rights reserved.
//

import SwiftUI

struct WorldLeadingView: View {

    @ObservedObject var viewModel = WorldLeadingModel()

    var body: some View {
        BarChartView(chartTitle: "COVID19 World", barColor: .blue, barChartData: viewModel.barChartData).padding()
    }
}

struct WorldLeadingView_Previews: PreviewProvider {
    static var previews: some View {
        WorldLeadingView()
    }
}


