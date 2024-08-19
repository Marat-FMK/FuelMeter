//
//  SliderView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 19.08.2024.
//

import SwiftUI

struct SlidersView: View {
    
    
    @State private var distanceSliderValue: Float = 0
    @State private var distanceTFValue: String = ""
    var distanceRange: ClosedRange<Float> = 0...2500
    
    @State private var fuelSliderValue: Float = 0
    @State private var fuelTFValue: String = ""
    var fuelRange: ClosedRange<Float> = 0...50
    
    @State private var priceSliderValue: Float = 0
    @State private var priceTFValue: String = ""
    var priceRange: ClosedRange<Float> = 0...150
    
    @State private var result: String = ""
    
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Image("pic")
                .resizable()
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Калькулятор поездки")
                    .frame(width: 370, alignment: .center)
                    .font(.largeTitle)
                
                Text(result)
                
                OneSliderAttribute(sliderValue: $distanceSliderValue, tfValue: $distanceTFValue, range: distanceRange, label: "Дистанция (км)")
                OneSliderAttribute(sliderValue: $fuelSliderValue, tfValue: $fuelTFValue, range: fuelRange, label: "Расход на 100 км (л)")
                OneSliderAttribute(sliderValue: $priceSliderValue, tfValue: $priceTFValue, range: priceRange, label: "Цена за литр")
                
                Button (action: takeResult) {
                    Text("Результат")
                }
                .font(.largeTitle)
                .frame(width: 300)
            }
            .sheet(isPresented: $isPresented, content: {
                ResultView(result: result, isPresented: $isPresented)
            })
        }
    }
    
    
    private func takeResult(){
        isPresented = true
        
        self.result = String(((distanceSliderValue * fuelSliderValue) / 100 ) * priceSliderValue)
        
        
        
        
//        let fue = Double(fuelСonsumption) ?? 0
//        let dis = Double(distance) ?? 0
//        let pri = Double(price) ?? 0
//        
//        summ = (( dis * fue ) / 100 ) * pri
    }
}

#Preview {
    SlidersView()
}
