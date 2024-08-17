//
//  RoudList.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 17.08.2024.
//

import SwiftUI

struct RoudList: View {
    
    let roads = Road.roads
    
    
    var body: some View {
        
        List(roads) { road in
            
            HStack{
                Text(road.numericName)
                    .frame(width: 100)
                
                Text(road.name)
                Spacer()
                Text(String(road.distance))
                    .frame(width: 80, alignment: .trailing)
                
                
            }
            
            
            
        }
    }
}

#Preview {
    RoudList()
}
