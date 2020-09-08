//
//  CountryDetail.swift
//  covid19-swiftui-app
//
//  Created by Ron Machoka on 9/2/20.
//  Copyright © 2020 Benjamin Bruch. All rights reserved.
//

import SwiftUI

struct CountryDetail: View {
    var countryName: String
    var totalConfirmedCases: Int
    
    var body: some View {
        HStack {
            Image("locationIcon").resizable()
                .frame(width: 15.0, height: 15.0).offset(y:-7)
                    VStack(alignment: .leading) {
                        Text(countryName).font(.custom("Product Sans Regular", size: 15))
                        Text(String(totalConfirmedCases) + " Confirmed cases").font(.custom("Product Sans Regular", size: 13))
                    }
            Spacer()
            
            
        }
    }
}

struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetail(countryName: "Country A", totalConfirmedCases: 2345)
    }
}
