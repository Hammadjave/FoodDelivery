//
//  CardDetail.swift
//  FoodDelivary
//
//  Created by Chohan on 10/03/2024.
//

import SwiftUI
import AlertToast

struct CardDetail: View {
    @State private var cardDetail = ""
    @State private var expCard = ""
    @State private var cVVCard = ""
    
    @State private var showToast = false
    
    var allTextFiledsFill: Bool {
        return !cardDetail.isEmpty && !expCard.isEmpty && !cVVCard.isEmpty
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 1)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text("Payment")
                        .bold()
                        .font(.system(size: 28))
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Card details")
                        .frame(width: 350,alignment: .leading)
                }
                .padding(.top, 30)
                TextField("Enter card details", text: $cardDetail)
                    .modifier(TextFieldButtonModifier())
                    .shadow(color: .black, radius: 2)
                    .padding()
                    .padding(.top, 10)
                ZStack {
                    HStack {
                        Text("Exp date")
                            .frame(width: 350, alignment: .leading)
                    }
                    HStack {
                        Text("CVV")
                            .frame(width: 100, alignment: .trailing)
                    }
                }
                HStack {
                    TextField("DD/MM", text: $expCard)
                        .padding()
                        .frame(width: 157, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .padding()
                    Spacer()
                    TextField("Enter CVV", text: $cVVCard)
                        .padding()
                        .frame(width: 157, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .padding()
                        Spacer()
                }
                Spacer()
                Button(action: {
                    showToast.toggle()
                }, label: {
                    Text("Pay now")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .frame(width: 335, alignment: .top)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.98, green: 0.53, blue: 0.12), location: 0.00),
                                    Gradient.Stop(color: Color(red: 1, green: 0.47, blue: 0.3), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.42, y: -0.3),
                                endPoint: UnitPoint(x: 0.54, y: 1.54)
                            )
                        )
                        .cornerRadius(20)
                        .shadow(color: Color(red: 0.79, green: 0.26, blue: 0.07).opacity(0.1), radius: 15, x: 0, y: 10)
                })
                .buttonStyle(.plain)
                .disabled(!allTextFiledsFill)
                Spacer()
                    .padding(.bottom, 40)
            }
        }
        .toast(isPresenting: $showToast) {
            AlertToast(displayMode: .alert, type: .systemImage("CongrulationImage", Color.secondary), title: "Your order has been successfully placed")
        }
    }
}

#Preview {
    CardDetail()
}
