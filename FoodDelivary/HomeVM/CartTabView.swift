//
//  CartTabView.swift
//  FoodDelivary
//
//  Created by Chohan on 01/02/2024.
//

import SwiftUI

struct CartTabView: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
        Text("Hello, Cart")
    }
}

#Preview {
    CartTabView(presentSideMenu: .constant(false))
}
