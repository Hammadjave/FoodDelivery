//
//  IntroPageView.swift
//  FoodDelivary
//
//  Created by Chohan on 19/12/2023.
//

import SwiftUI

struct IntroPageView: View {
    @State private var pageIndex = 0
    @State private var isSheetPresnet = false
    @State private var loginSheetPresnet = false
    private let sampleDatas: [IntroScreenData] = IntroScreenData.sampleDatas
    private var isLastPage: Bool { pageIndex == sampleDatas.count - 1 }
    
    let intro: IntroScreenData
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 1)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Image("Good")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 24)
                    Spacer()
                        .frame(maxWidth: .infinity)
                }
                .padding()
                TabView(selection: $pageIndex) {
                    ForEach(sampleDatas) { data in
                        IntroScreenView(introScreen: data)
                    }
                }
                .tabViewStyle(.page)
                .animation(.linear, value: pageIndex)
                .transition(.slide)
                .frame(height: 387)
                
                Spacer()
                    .frame(maxHeight: .infinity)
                
                Button(action: skipButtonAction) {
                    Text(isLastPage ? "Login" : "Skip")
                        .foregroundColor(.white)
                        .frame(width: 335, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    // MARK: - Private Functions
    
    private func skipButtonAction() {
        isLastPage ? moveToLoginScreen() : incrementPage()
    }
    
    private func moveToLoginScreen() {
        UserDefaults.standard.set(true, forKey: "isIntroSeen")
    }
    
    private func incrementPage() {
        pageIndex += 1
    }
}

#Preview {
    IntroPageView(intro: IntroScreenData.sampleDatas[0])
}
