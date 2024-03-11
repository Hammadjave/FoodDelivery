//
//  FavouriteTabView.swift
//  FoodDelivary
//
//  Created by Chohan on 01/02/2024.
//

import SwiftUI

struct FavouriteTabView: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
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
            Spacer()
            Text("Hello, Fav Side menu")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    FavouriteTabView(presentSideMenu: .constant(false))
}
