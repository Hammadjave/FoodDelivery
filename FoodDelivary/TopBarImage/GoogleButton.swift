//
//  GoogleButton.swift
//  FoodDelivary
//
//  Created by Chohan on 23/12/2023.
//

import SwiftUI
import AuthenticationServices

struct GoogleButton: View {
    
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
                HStack {
                    Image("Google")
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                    Text("Sign-in with Google")
                    .font(Font.custom("Sk-Modernist", size: 14))
                    .underline()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding()
                    
                   
                }
                .background(Color.orange)
                .cornerRadius(10)
                .frame(width: 224, height: 50)
            
         })
        .cornerRadius(7)
        .frame(width: 50, height: 50)
        
    }
}

#Preview {
    GoogleButton(action: {})
}
