//
//  MainTabbedView.swift
//  FoodDelivary
//
//  Created by Chohan on 01/02/2024.
//

import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0

    var body: some View {
        ZStack {
            HomeScreen(presentSideMenu: $presentSideMenu)
            TabView(selection: $selectedSideMenuTab) {
                HomeScreen(presentSideMenu: $presentSideMenu)
                    .tag(0)
                    FavouriteTabView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                ChatView(presentSideMenu: $presentSideMenu)
                    .tag(2)
            }
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

#Preview {
    MainTabbedView()
}
