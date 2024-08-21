//
//  Slider.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 19.08.2024.
//

import SwiftUI

struct OneSliderAttribute: View {
   
    @Binding var sliderValue: Float
    @Binding var tfValue: String
    @State var showAlert = false
    
    let range: ClosedRange<Float>
    let label: String
    let placeholderValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
       
            Text(label)
                .font(.largeTitle)
            
            HStack {
                Text(String(format:"%.1f", sliderValue))
                    .frame(width: 90, alignment: .leading)
                    .font(.system(size: 25))
                
                Slider(value: $sliderValue, in : range)
                    .onChange(of: sliderValue) { _, newValue in
                        tfValue = String(format: "%.1f",newValue)
                    }
                
                TextField(placeholderValue,text: $tfValue) { _ in
                    withAnimation {
                        checkValue()
                    }
                }
                    .frame(width: 70)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
//                    .alert("Некорректные данные", isPresented: $showAlert, actions: {})
//                {
//                    Text("Введите цифры")
//                }
            }
        }.padding()
    }
        
    
    private func checkValue() {
        if let value = Float(tfValue), range.contains(sliderValue) {
            self.sliderValue = value
        } else {
            showAlert.toggle()
            sliderValue = 0
            tfValue = ""
        }
    }
    
}

#Preview {
    OneSliderAttribute(sliderValue: .constant(1100), tfValue: .constant("222"), range: 0...2500, label: "Distance", placeholderValue: "km")
}
