//
//  AboutRoudView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 17.08.2024.
//

import SwiftUI

struct AboutRoudView: View {
    
    var road: Road
    
    var body: some View {
        
        Image(road.pic)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
        HStack {
            Text(road.numericName)
            Text(road.name)
        }
        HStack {
            Text(road.organization)
            Text(" - ")
            Text(String(road.distance))
        }
        
    }
}
#Preview {
    AboutRoudView(road: Road.roads.first!)
}
