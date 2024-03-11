//
//  ContentView.swift
//  FoodDelivary
//
//  Created by Chohan on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage ("signIn") var signIn = false
    @AppStorage ("isIntroSeen") var isIntroSeen = false
    
    var body: some View {
        if isIntroSeen {
            if !signIn {
                LoginPageView()
            } else {
                MainTabbedView()
            }
        } else {
            IntroPageView(intro: IntroScreenData.sampleDatas[0])
        }
    }
}

#Preview {
    ContentView()
}
