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
        
        Text("Сумма за поездку")
            .font(.largeTitle)
        Text("\(summ)")
            .padding()
        
    }
}

#Preview {
    ResultView(summ: .constant(1200))
}
