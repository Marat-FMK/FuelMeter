//
//  RoudList.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 17.08.2024.
//

import SwiftUI

struct RoudListView: View {
    
    let roads = Road.roads
    
    var body: some View {
        NavigationView() {
            List(roads) { road in
                NavigationLink(destination: AboutRoudView(road: road)) {
                    HStack{
                        Text(road.numericName)
                            .frame(width: 100, alignment: .leading)
                        
                        Text(road.name)
                    
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("Roads")
                
            }
        }
    }
}

#Preview {
    RoudListView()
}
