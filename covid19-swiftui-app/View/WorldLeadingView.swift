//
//  WorldLeadingView.swift
//  covid19-swiftui-app
//
//  Created by Ron Machoka on 27.08.20.
//  Copyright © 2020 Ron Machoka. All rights reserved.
//

import SwiftUI

struct WorldLeadingView: View {

    @ObservedObject var viewModel = WorldLeadingModel()

    
    
    var body: some View {
        BarChartView(chartTitle: "Worldwide Cases", barColor: .blue, barChartData: viewModel.barChartData)
    }
}

struct WorldLeadingView_Previews: PreviewProvider {
    static var previews: some View {
        WorldLeadingView()
    }
}


