//
//  ContentView.swift
//  covid19-swiftui-app
//
//  Created by Ron Machoka on 25.08.20.
//  Copyright © 2020 Ron Machoka. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            WorldLeadingView().tabItem {
                Text("World Leading") }.tag(1)
            KenyaView().tabItem {
                Text("Kenya")
            }.tag(2)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

