//
//  ContentView.swift
//  covid19-swiftui-app
//
//  Created by BBruch on 25.08.20.
//  Copyright © 2020 Benjamin Bruch. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            WorldLeadingView().tabItem {
                Text("World Leading") }.tag(1)
            GermanyView().tabItem {
                Text("Germany")
            }.tag(2)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

