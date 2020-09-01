//
//  Country.swift
//  covid19-swiftui-app
//
//  Created by Ron Machoka on 28.08.20.
//  Copyright © 2020 Ron Machoka. All rights reserved.
//

import Foundation

struct Country: Hashable, Identifiable {
    let id: String
    let countryCode: String
    let name: String
    let newConfirmed: Int
    let totalConfirmed: Int
    let newDeaths: Int
    let totalDeaths: Int
    let newRecovered: Int
    let totalRecovered: Int
    let date: String
}
