//
//  TopBarImage.swift
//  FoodDelivary
//
//  Created by Chohan on 22/12/2023.
//

import SwiftUI

struct TopBarImage: View {
    
    @Environment (\.dismiss) private var dismisSignUp
    var body: some View {
        HStack {
            Spacer()
                .frame(maxWidth: .infinity)
            Image("Good")
                .resizable()
                .frame(width: 34, height: 23.25447)
            Spacer()
                .frame(maxWidth: .infinity)
            Button("", action: {
//                dismisSignUp()
            })
            .foregroundColor(Color(red: 0.98, green: 0.35, blue: 0.12))
        }
    }
}

#Preview {
    TopBarImage()
}
