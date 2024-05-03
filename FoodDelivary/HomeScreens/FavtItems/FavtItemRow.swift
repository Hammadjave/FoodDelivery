//
//  FavtItemRow.swift
//  FoodDelivary
//
//  Created by Chohan on 12/03/2024.
//

import SwiftUI
import CachedAsyncImage

struct FavtItemRow: View {
    let favtItems: FoodItem
    let favtFoodItem: FavouriteFoodItems
    
    var body: some View {
        VStack {
            CachedAsyncImage(url: URL(string: favtItems.image),transaction: Transaction(animation: .easeInOut)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .background(.thinMaterial)
                } else {
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                    }
                }
            }
                Text(favtItems.name)
                .bold()
                Text(favtItems.description)
            }
    }
}

#Preview {
    FavtItemRow(favtItems: .init(name: "FavtFood", description: "Nothing", price: 10, image: ""), favtFoodItem: .init())
}
