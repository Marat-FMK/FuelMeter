//
//  ResultView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 16.08.2024.
//

import SwiftUI

struct ResultView: View {
    @Binding var summ: Double
    var body: some View {
        
        ZStack {
            Image("pic3")
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .opacity(0.9)
                        .frame(width: 310, height: 200)
                        .cornerRadius(30)
                    
                    
                    
                    
                    VStack { Text("Сумма за поездку")
                            .font(.largeTitle)
                        
                        Text(String(format: "%.1f",summ ))
                            .padding()
                    }
                }.offset(y: -90)
              
                Button (action: {} ) {
                    Text("OK")
                        .frame(width: 100, height: 50)
                        .foregroundStyle(Color.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 3))
                        .shadow(radius: 20)
                }
            }
        }
    }
    
    
    private func dismissView() {
    
    }
}
    


#Preview {
    ResultView(summ: .constant(1200))
}
