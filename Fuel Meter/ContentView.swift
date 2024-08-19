//
//  ContentView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
     
        TabView {
//            TextFieldsView()
            
            SlidersView()
                .tabItem {
                    Image(systemName: "gauge.open.with.lines.needle.67percent.and.arrowtriangle.and.car")
                    Text("Главная")
                }
            
            RoudListView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Rouds")
                    
                }
            
        }
        
        
        
    }
    
}

#Preview {
    ContentView()
}
