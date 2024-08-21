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
        
        Text(" Настройка диапазона значений слайдера ")
        
        SettingsRow(rangeName: "Дистанция", rangeAt: $distanceRangeAt, rangeTo: $distanceRangeTo)
        SettingsRow(rangeName: "Расход", rangeAt: $fuelRangeAt, rangeTo: $fuelRangeTo)
        SettingsRow(rangeName: "Стоимость", rangeAt: $priceRangeAt, rangeTo: $priceRangeTo)
        
        Button (action: saveToUD) {
            Text("Сохранить")
        }
    }
    
    
    private func int(from value: String) -> Int {
        
        guard let value = Int(value) else { return 0 }
        return value
        
        
    }
    
     func setRanges() -> [ClosedRange<Int>] {
         
         let distanceUserRange = int(from: distanceRangeAt)...int(from: distanceRangeTo)
         let fuelUserRange = int(from: fuelRangeAt)...int(from: fuelRangeTo)
         let priceUserRange = int(from: priceRangeAt)...int(from: priceRangeTo)
         
         return [distanceUserRange,fuelUserRange,priceUserRange]
    }
    
    private func saveToUD() {
        
    }
    
}

#Preview {
    SliderSettings()
    
}
