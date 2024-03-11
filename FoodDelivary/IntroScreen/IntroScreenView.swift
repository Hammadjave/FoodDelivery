//
//  IntroScreenView.swift
//  FoodDelivary
//
//  Created by Chohan on 19/12/2023.
//

import SwiftUI

struct IntroScreenView: View {
    
    let introScreen: IntroScreenData
    
    var body: some View {
        VStack(spacing: 10) {
            Text(introScreen.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .frame(height: 62)
            Image(introScreen.image)
                .resizable()
                .scaledToFit()
                .frame(height: 255)
            Spacer()
                .frame(height: 60)
        }
    }
}

#Preview {
    IntroScreenView(introScreen: IntroScreenData.sampleDatas[0])
}
