//
//  ChatView.swift
//  FoodDelivary
//
//  Created by Chohan on 16/02/2024.
//

import SwiftUI

struct ChatView: View {
    
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
            ChatSideMenuView()
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ChatView(presentSideMenu: .constant(false))
}
