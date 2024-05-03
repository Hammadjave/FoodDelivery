//
//  CartItemRow.swift
//  FoodDelivary
//
//  Created by Chohan on 24/02/2024.
//

import SwiftUI
import CachedAsyncImage

struct CartItemRow: View {
    
    let item: FoodItem
//    let cart: Cart
    @Binding var count: Int
    
    var body: some View {
        HStack {
            ZStack {
                CachedAsyncImage(url: URL(string: item.image),transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                    } else {
                        HStack {
                            Spacer()
                            Image(systemName: "photo")
                                .imageScale(.large)
                            Spacer()
                        }
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("$ \(item.price * count)")
                .font(.headline)
        }
    }
}

#Preview {
    CartItemRow(item: .init(name: "", description: "", price: 0, image: ""), count: .constant(0))
}
