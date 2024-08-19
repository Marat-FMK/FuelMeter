//
//  ResultsRows.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 19.08.2024.
//

import SwiftUI

struct ResultsRows: View {
    
    let leftText: String
    let rightText: String
    
    var body: some View {
        HStack {
            Text(leftText)
                .font(.title2)
                .frame(width: 160, alignment: .leading)
            Spacer()
            Text(rightText)
                .frame(width:120,alignment: .leading)
        }
        .frame(width: 300)
    }
}

#Preview {
    ResultsRows(leftText: "Total summ", rightText: "222")
}
