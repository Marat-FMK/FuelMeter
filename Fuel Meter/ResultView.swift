//
//  ResultView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 16.08.2024.
//

import SwiftUI

struct ResultView: View {
    
    @Environment(\.dismiss) private var dismiss
    
//    @Binding var isPresented: Bool
    let distance: Float
    let literOf100: Float
    let price: Float
    @State var drivenMins: Int = 0
    @State var drivenHours: Int = 0
    
    
//    let result: String
    var body: some View {
        
        ZStack {
            Image("pic3")
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .opacity(0.9)
                        .frame(width: 370, height: 530)
                        .cornerRadius(30)
                    
                    VStack(spacing: 20) {
                        Text("Рассчет поездки")
                            .font(.largeTitle)
                        
                        ResultsRows(leftText: "Текущее время ", rightText: Date().formatted())
                        ResultsRows(leftText: "Время в пути -", rightText: " \(drivenTime())")
                        ResultsRows(leftText: "Время прибытия -", rightText: setArrivalTime())
                        ResultsRows(leftText: "Стоимость топлива -", rightText: resultSumm() )
                        ResultsRows(leftText: "Диситанция -", rightText: "\(stringAndformat(distance)) км ")
                        ResultsRows(leftText: "Цена за литр бензина -"  , rightText: "\(stringAndformat( price))руб/л")
                        ResultsRows(leftText: "Расход топлива на 100 км -", rightText: "\(stringAndformat( literOf100)) л/100км")
                    }
                }.offset(y: -90)
                    .padding(.top,50)
                
                Button (action: okButtonPressed ) {
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
    
    
    private func okButtonPressed() {
        dismiss()
    }
    
    private func drivenTime() -> String {
        
        let kmOnHour: Float = 90
        
        let drivenHour = Int(distance / kmOnHour)
        let drivenMin = Int((((distance / kmOnHour) * 60 ) - Float(drivenHour * 60)))
        
       drivenMins = drivenMin
       drivenHours = drivenHour
        
        return " \(drivenHour)ч \(  drivenMin )мин"
    }
    
    private func stringAndformat(_ number: Float) -> String {
      
         return String(format: "%.2f",number)
       
    }
    
    private func setArrivalTime() -> String {
        
        let interval = Double((distance / 90 ) * 3600)
        var date = Date()
        date.addTimeInterval(TimeInterval(interval))
        return date.formatted()
    }
    
    private func resultSumm() -> String {
    String(Int(((distance * literOf100) / 100 ) * price))
    }
}


#Preview {
    ResultView(/*isPresented: .constant(true),*/ distance: 200, literOf100: 11, price: 60/*, result: "tyt ok"*/)
}
