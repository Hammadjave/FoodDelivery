//
//  CartTabbedScreen.swift
//  FoodDelivary
//
//  Created by Chohan on 24/02/2024.
//

import SwiftUI

struct CartTabbedScreen: View {
    
    @StateObject private var cart = Cart()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1)
                    .ignoresSafeArea(.all)
                VStack {
                    List {
                        ForEach(cart.items) { item in
                            CartItemRow(item: item, count: .constant(0))
                        }
                        
                        .onDelete(perform: { indexSet in
                            cart.items.remove(atOffsets: indexSet)
                        })
                    }
                    NavigationLink(destination: PaymentView(), label: {
                        Text("Process to payment")
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
                    .disabled(cart.items.isEmpty)
                }
            }
            .navigationTitle("Cart")
            .navigationBarItems(trailing: EditButton())
        }
        .onReceive(NotificationCenter.default.publisher(for: .taskAddedNotification)) { notification in
            guard let receivedItem = notification.object as? FoodItem else { return}
            cart.addItem(receivedItem)
        }
    }
}

#Preview {
    CartTabbedScreen()
}


