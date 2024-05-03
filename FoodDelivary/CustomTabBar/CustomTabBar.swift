//
//  CustomTabBar.swift
//  FoodDelivary
//
//  Created by Chohan on 23/03/2024.
//

import SwiftUI

struct CustomTabBar: View {
    @State private var isSelected : Int = 0
    @State var presentSideMenu = false
    var body: some View {
        ZStack(alignment: .bottom) {
            if isSelected == 0 {
                HouseTabView(presentSideMenu: $presentSideMenu)
            } else if isSelected == 1 {
                FavouriteItems()
            } else if isSelected == 2 {
                CartTabbedScreen()
            }
            HStack {
                homeButton()
                    .frame(maxWidth: .infinity)
                favtButton()
                    .frame(maxWidth: .infinity)
                cartButton()
                    .frame(maxWidth: .infinity)
                
            }
            .frame(height: 60)
            .background(.orange).opacity(0.3)
            .background(ignoresSafeAreaEdges: .bottom)
            
        }
    }
    @ViewBuilder private func homeButton() -> some View  {
        Button(action: {
            isSelected = 0
        }, label: {
            VStack {
                Image(systemName: "house")
                Text("House")
            }
        })
    }
    @ViewBuilder private func favtButton() -> some View  {
        Button(action: {
            isSelected = 1
        }, label: {
            VStack {
                Image(systemName: "heart.circle")
                Text("Favt")
            }
        })
    }
    @ViewBuilder private func cartButton() -> some View  {
        Button(action: {
            isSelected = 2
        }, label: {
            VStack {
                Image(systemName: "cart")
                Text("Cart")
            }
        })
    }
}

#Preview {
    CustomTabBar()
}
