//
//  ContentView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 16.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var fuelСonsumption = ""
    var body: some View {
        ZStack {
            
            Image("pic")
            
            VStack{
                TextField( "  л/100км", text: $fuelСonsumption)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.purple)
                        
                    )
                
                    .frame(width: 300,height: 30)
                    .font(.largeTitle)
                
                
                Spacer()
                
                Button ("Рассчитать") {
                    
                }
                .font(.largeTitle)
                .foregroundStyle(Color.red)
            }
        }
    }
}


#Preview {
    ContentView()
}
