//
//  FoodItemRow.swift
//  FoodDelivary
//
//  Created by Chohan on 20/02/2024.
//

import SwiftUI
import CachedAsyncImage

struct FoodItemRow: View {
    let item : FoodItem
    var body: some View {
        VStack {
            Spacer(minLength: 7)
            ZStack {
            CachedAsyncImage(url: URL(string: item.image),transaction: Transaction(animation: .easeInOut)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .background(.thinMaterial)
                    Image("heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 270)
                        .padding(.top, 120)
                    HStack {
                        Text(item.name)
                    }
                } else {
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Spacer()
                    }
                }
            }
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
    FoodItemRow(item: FoodItem(name: "hello", description: "", price: 2, image: ""))
}
