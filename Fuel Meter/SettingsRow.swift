//
//  SettingsRow.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 21.08.2024.
//

import SwiftUI

struct SettingsRow: View {
   
    let rangeName: String
    @Binding var rangeAt: String
    @Binding var rangeTo: String
    
    var body: some View {
        
        HStack {
            Text(rangeName)
                .font(.largeTitle)
                .frame(width: 200)
        
            TextField("от", text: $rangeAt)
                .textFieldStyle(.roundedBorder)
            Spacer()
            TextField("до", text: $rangeTo)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
    
    
}

#Preview {
    SettingsRow(rangeName: "дистанция", rangeAt: .constant("0"), rangeTo: .constant("2350"))
}
