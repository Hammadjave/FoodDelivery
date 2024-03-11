//
//  HomeScreen.swift
//  FoodDelivary
//
//  Created by Chohan on 22/01/2024.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
        VStack {
            TabView {
                HouseTabView(presentSideMenu: $presentSideMenu)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                Text("Items Like")
                    .tabItem {
                        Label("Fav", systemImage: "heart.circle")
                    }
                BellTabView()
                    .tabItem {
                        Label("Notification", systemImage: "bell")
                    }
                CartTabbedScreen()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
            }
            
        }
    }
}

#Preview {
    HomeScreen(presentSideMenu: .constant(false))
}
