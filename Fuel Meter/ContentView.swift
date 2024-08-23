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
        
            
            SlidersView()
                .tabItem {
                    Image(systemName: "gauge.open.with.lines.needle.67percent.and.arrowtriangle.and.car")
                    Text("Калькулятор")
                }
            
            RoudListView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Дороги")
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
