//
//  FavouriteItems.swift
//  FoodDelivary
//
//  Created by Chohan on 12/03/2024.
//

import SwiftUI

struct FavouriteItems: View {
    @StateObject var favtFood = FavouriteFoodItems()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1)
                    .ignoresSafeArea(.all)
                ScrollView(.vertical) {
//                    Text("")
                    ForEach(favtFood.favtItem) { food in
                        FavtItemRow(favtItems: food, favtFoodItem: favtFood)
                    }
                }
            }
            .navigationTitle("FavtFood")
        }
        .onReceive(NotificationCenter.default.publisher(for: .favtItemNotivication)) { favtrItemNotification in
            guard let favtItem = favtrItemNotification.object as? FoodItem else {return}
            favtFood.addFavtItems(favtItem)
        }
    }
}

#Preview {
    FavouriteItems()
}
