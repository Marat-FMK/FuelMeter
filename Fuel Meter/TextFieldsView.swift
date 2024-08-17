//
//  TextFieldsView.swift
//  Fuel Meter
//
//  Created by Marat Fakhrizhanov on 17.08.2024.
//

import SwiftUI

struct TextFieldsView: View {
    @State var fuelСonsumption = ""
    @State var distance = ""
    @State var price = ""
    @State private var isPresented: Bool = false
    @State private var showAlert: Bool = false
    
    
   
    @State var summ: Double = 0.0
    
    @State var fuel: Double = 0
    
    var body: some View {
        
        ZStack {
            Image("pic2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.6)
            VStack (alignment: .leading) {
                
                Spacer()
                
                Text("Расход топлива")
                    .font(.largeTitle)
                TextField( "  л/100км", text: $fuelСonsumption)
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.purple)
                    )
                    .frame(width: 300,height: 30)
                    .font(.largeTitle)
                    .padding()
                    .alert("Введите цифры", isPresented: $showAlert, actions: {}){
                        Text("Поле должно содержать только цифры")
                    }
                
                
                Text("Дистанция")
                    .font(.largeTitle)
                TextField( "  км ", text: $distance)
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.purple)
                    )
                    .frame(width: 300,height: 30)
                    .font(.largeTitle)
                    .padding()
                
                
                Text("Цена за литр")
                    .font(.largeTitle)
                TextField( "  руб ", text: $price)
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.purple)
                    )
                    .frame(width: 300,height: 30)
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                Button ( action: {
                    isPresented = true
                    
                    let fue = Double(fuelСonsumption) ?? 0
                    let dis = Double(distance) ?? 0
                    let pri = Double(price) ?? 0
                    
                    summ = (( dis * fue ) / 100 ) * pri
                    
                } ) {
                    Text("Рассчитать")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                }
                .sheet(isPresented: $isPresented, content: {
                    ResultView(summ: $summ)
                })
                .padding()
                .frame(width: 250, height: 30, alignment: .center)
                .background(Color.red)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 3))
                .offset(x: 40)
                
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    TextFieldsView()
}
