//
//  PaymentView.swift
//  FoodDelivary
//
//  Created by Chohan on 01/05/2024.
//

import SwiftUI

struct PaymentView: View {
    
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
    
    var orderChoosing : [OrderModelObject] = [
        OrderModelObject(iconName: "heart", titleName: "BankAccount", type: .bankAccount),
        OrderModelObject(iconName: "house", titleName: "EasyPaisa", type: .easyPaisa)
        
    ]
    
    @StateObject private var cart = Cart()
    
    @State private var showingAlert = false
    
    var body: some View {
        List {
            ForEach(orderChoosing, id: \.titleName) { choose in
                geetingListRow(odering: choose)
            }
        }
    }
    
    @ViewBuilder private func geetingListRow(odering : OrderModelObject) -> some View {
        switch odering.type {
        case.bankAccount:
            ZStack {
                BankAcount(icon: odering.iconName, name: odering.titleName)
                NavigationLink(destination: CardDetail()) {
                    
                }
//                .disabled(cart.items.isEmpty)
            }
        case .easyPaisa:
            
                Button(action: {
                    if !openEasyPaisaApp() {
                           showingAlert = true
                       }
                       }) {
                           EasyPaisaView(iconName: odering.iconName, title: odering.titleName)
                       }
//                       .disabled(cart.items.isEmpty)
                       .alert(isPresented: $showingAlert) {
                           Alert(title: Text("Error"), message: Text("EasyPaisa app is not installed."), dismissButton: .default(Text("OK")))
                       }
        case .jazzCash:
            ZStack {
                
            }
        }
    }
}

#Preview {
    PaymentView()
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

struct EasyPaisaView: View {
    let iconName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.blue)
            Text(title)
                .foregroundColor(.blue)
        }
    }
}

private func openEasyPaisaApp() -> Bool {
    guard let url = URL(string: "https://easypaisa.com.pk/") else {
        return false
    }
    if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url)
        return true
    } else {
        return false
    }
}
