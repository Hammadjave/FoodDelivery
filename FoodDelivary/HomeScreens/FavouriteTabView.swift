//
//  FavouriteTabView.swift
//  FoodDelivary
//
//  Created by Chohan on 01/02/2024.
//

import SwiftUI

struct FavouriteTabView: View {
    @StateObject var favtFood = FavouriteFoodItems()
    @Binding var presentSideMenu: Bool
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                .padding(.leading, 10)
                .background(.orange.opacity(0.4))
                // Text Here
                ScrollView(.vertical) {
                    ForEach(favtFood.favtItem) { food in
                        FavtItemRow(favtItems: food, favtFoodItem: favtFood)
                    }
                }
            }
//            .navigationTitle("Favourite Food")
            .zIndex(1)
        }
//        .padding(.horizontal, 24)
        .onReceive(NotificationCenter.default.publisher(for: .favtItemNotivication)) { favtrItemNotification in
            guard let favtItem = favtrItemNotification.object as? FoodItem else {return}
            favtFood.addFavtItems(favtItem)
        }
    }
}

#Preview {
    FavouriteTabView(presentSideMenu: .constant(false))
}
