//
//  FoodItemRow.swift
//  FoodDelivary
//
//  Created by Chohan on 20/02/2024.
//

import SwiftUI
import CachedAsyncImage

struct FoodItemRow: View {
    @State private var isLiked = false
    let item : FoodItem
    var body: some View {
        VStack {
            Spacer(minLength: 7)
            ZStack(alignment: .bottomTrailing) {
                CachedAsyncImage(url: URL(string: item.image),transaction: Transaction(animation: .easeInOut)) { phase in
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
                Button(action: {
                    isLiked.toggle()
                    NotificationCenter.default.post(name: .favtItemNotivication, object: item)
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .tint(isLiked ? .red : .black)
                        .font(.system(size: 30))
                        
                }
                .frame(width: 30, height: 30)
                .padding(.trailing, 10)
                .padding(.bottom, 30)
            }
            Text(item.name)
                .font(.title3)
                .fontWeight(.heavy)
                .frame(alignment: .center)
            
            Text("$ \(item.price)")
                .font(.headline)
            Spacer(minLength: 5)
            
            
        }
    }
}

#Preview {
    FoodItemRow(item: FoodItem(name: "", description: "", price: 2, image: ""))
}
