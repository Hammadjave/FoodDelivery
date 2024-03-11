//
//  CartTabbedScreen.swift
//  FoodDelivary
//
//  Created by Chohan on 24/02/2024.
//

import SwiftUI

struct CartTabbedScreen: View {
    enum orderFood {
        case bankAccount
        case easyPaisa
        case jazzCash
    }
    
    struct OrderModelObject {
        let iconName: String
        let titleName: String
        let type : orderFood
    }
    
    @StateObject private var cart = Cart()
    @State private var toogle = false
    
    var orderChoosing : [OrderModelObject] = [
        OrderModelObject(iconName: "heart", titleName: "BankAccount", type: .bankAccount)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1)
                    .ignoresSafeArea(.all)
                VStack {
                    List(orderChoosing, id: \.titleName) { food in
                        geetingListRow(odering: food)
                        ForEach(cart.items) { item in
                            CartItemRow(item: item, cart: cart)
                        }
                        
                        .onDelete(perform: { indexSet in
                            cart.items.remove(atOffsets: indexSet)
                        })
                        .listRowSeparator(.visible)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .ignoresSafeArea(edges: .horizontal)
                        //                .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        
                        
                    }
//                    List {
//                        ForEach(cart.items) { item in
//                            CartItemRow(item: item, cart: cart)
//                            
//                        }
//                        .onDelete(perform: { indexSet in
//                            cart.items.remove(atOffsets: indexSet)
//                        })
//                        .listRowSeparator(.visible)
//                        .listRowInsets(EdgeInsets())
//                        .listRowBackground(Color.clear)
//                        .ignoresSafeArea(edges: .horizontal)
//                        //                .background(Color.gray.opacity(0.3))
//                        .cornerRadius(10)
//                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
//                        
//                        
//                    }
                    .navigationTitle("Cart")
                    .navigationBarItems(trailing: EditButton())
                    
                    //
                    //                    HStack {
                    //                        Button(action: {
                    //                            toogle = true
                    //                        }, label: {
                    //                            Ellipse()
                    //                                .stroke()
                    //                                .frame(width: 20, height: 20)
                    //                            Text("Pay On arrival")
                    //                                .foregroundColor(self.toogle ? .black : .orange)
                    //                        })
                    //                    }
                    //                    .padding()
                    
                    NavigationLink(destination: ContentUnavailableView("No Data", systemImage: "swift"), label: {
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
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .taskAddedNotification)) { notification in
            guard let receivedItem = notification.object as? FoodItem else { return}
            cart.addItem(receivedItem)
        }
    }
    @ViewBuilder private func geetingListRow(odering : OrderModelObject) -> some View {
        switch odering.type {
        case.bankAccount:
            ZStack {
                BankAcount(icon: odering.iconName, name: odering.titleName)
                NavigationLink(destination: CardDetail()) {
                    
                }
            }
        case .easyPaisa:
            ZStack {
                
            }
        case .jazzCash:
            ZStack {
                
            }
        }
    }
}

#Preview {
    CartTabbedScreen()
}


struct BankAcount : View {
    let icon: String
    let name: String
    var body: some View {
        HStack(spacing: 55) {
            Image(icon)
            Text(name)
            Spacer()
        }
        
    }
}
