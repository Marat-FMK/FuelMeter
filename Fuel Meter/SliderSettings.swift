//
//  CalculationSettings.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 21.08.2024.
//

import SwiftUI

struct SliderSettings: View {
    @State var distanceRangeAt: String = "0"
    @State var distanceRangeTo: String = "0"
    @State var fuelRangeAt: String = "0"
    @State var fuelRangeTo: String = "0"
    @State var priceRangeAt: String = "0"
    @State var priceRangeTo: String = "0"
    
   
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            Text(" Настройка диапазона значений слайдера ")
            Spacer()
            SettingsRow(rangeName: "Дистанция", rangeAt: $distanceRangeAt, rangeTo: $distanceRangeTo)
            SettingsRow(rangeName: "Расход", rangeAt: $fuelRangeAt, rangeTo: $fuelRangeTo)
            SettingsRow(rangeName: "Стоимость", rangeAt: $priceRangeAt, rangeTo: $priceRangeTo)
            Button (action: saveToUD) {
                Text("Сохранить")
            }
        }
            .padding(EdgeInsets(top: 80, leading: 16, bottom: 50, trailing: 16))
    }
    
    
    private func float(from value: String) -> Float {
        guard let value = Float(value) else { return 0 }
        return value
    }
    
     func setRanges() -> [ClosedRange<Float>] {
         
         let distanceUserRange = float(from: distanceRangeAt)...float(from: distanceRangeTo)
         let fuelUserRange = float(from: fuelRangeAt)...float(from: fuelRangeTo)
         let priceUserRange = float(from: priceRangeAt)...float(from: priceRangeTo)
         
         let ranges = [distanceUserRange,fuelUserRange,priceUserRange]
         
         UserDefaults.standard.set(distanceUserRange, forKey: "distance")
         
         return ranges
    
         
         
        
    }
    
    private func saveToUD() {
        
    }
    
}

#Preview {
    SliderSettings()
    
}
