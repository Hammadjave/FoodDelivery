//
//  HomeTopBar.swift
//  FoodDelivary
//
//  Created by Chohan on 03/02/2024.
//

import SwiftUI

struct HomeTopBar: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "circle.grid.2x2")
                        .font(.title)
                        .padding(10)
                        .background(Color.pink.opacity(0.1))
                        .foregroundColor(Color.pink)
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("Person")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(.circle)
                        .padding(5)
//                        .background(Color.pink.opacity(0.1))
                        .cornerRadius(7)
//                        .foregroundColor(Color.pink)
                })
                
                
            }
            .overlay {
                HStack {
                    Image("Person")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(7)
                        .padding(5)
                    Text("Pakistan, Faislabad")
                    
                }
            }
            .padding()
            ScrollView(.vertical, showsIndicators: false){
                
            }
        }
    }
}

#Preview {
    HomeTopBar()
}
