//
//  SliderView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 19.08.2024.
//

import SwiftUI

struct SlidersView: View {
    
    
    @State private var distanceSliderValue: Float = 200
    @State private var distanceTFValue: String = ""
    var distanceRange: ClosedRange<Float> = 0...2500
    
    @State private var fuelSliderValue: Float = 11
    @State private var fuelTFValue: String = ""
    var fuelRange: ClosedRange<Float> = 0...30
    
    @State private var priceSliderValue: Float = 58
    @State private var priceTFValue: String = ""
    var priceRange: ClosedRange<Float> = 0...110
    
    @State private var result: String = "0"
    
    @State private var isPresented = false
    @FocusState var isfocused: Bool
    
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
                
                VStack {
                    OneSliderAttribute(sliderValue: $distanceSliderValue, tfValue: $distanceTFValue, range: distanceRange, label: "Дистанция (км)", placeholderValue: "км")
                    OneSliderAttribute(sliderValue: $fuelSliderValue, tfValue: $fuelTFValue, range: fuelRange, label: "Расход на 100 км (л)", placeholderValue: "л")
                    OneSliderAttribute(sliderValue: $priceSliderValue, tfValue: $priceTFValue, range: priceRange, label: "Цена за литр", placeholderValue: "руб")
                }
                .focused($isfocused)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Done") {
                            isfocused = false
                        }
                    }
                }
                Button (action: takeResult) {
                    Text("Результат")
                }
                .font(.largeTitle)
                .frame(width: 300)
            }
        }
        .onTapGesture {
            isfocused = false
        }
        .sheet(isPresented: $isPresented, content: {
            ResultView( /*isPresented: $isPresented,*/ distance: distanceSliderValue, literOf100: fuelSliderValue, price: priceSliderValue/*, result: result*/)
        })
    }
    
    
    
    private func takeResult(){
//        self.result = String(Int(((distanceSliderValue * fuelSliderValue) / 100 ) * priceSliderValue))
        isPresented = true
    }
}


#Preview {
    SlidersView()
}
