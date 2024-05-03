//
//  Practice.swift
//  FoodDelivary
//
//  Created by Chohan on 02/04/2024.
//

import SwiftUI

struct Practice: View {
    var body: some View {
        VStack {
                   Text("Congratulations!")
                       .font(.title)
                       .foregroundColor(.green)
                       .padding()
                       .background(Color.white)
                       .cornerRadius(10)
                       .shadow(radius: 5)
                   Image(systemName: "star.fill")
                       .font(.largeTitle)
                       .foregroundColor(.yellow)
                       .padding()
               }
    }
}

#Preview {
    Practice()
}
