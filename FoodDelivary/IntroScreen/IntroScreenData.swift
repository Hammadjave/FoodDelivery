//
//  IntroScreenModel.swift
//  FoodDelivary
//
//  Created by Chohan on 19/12/2023.
//

import Foundation

struct IntroScreenData: Identifiable, Equatable {
    let id: Int
    let title: String
    let image: String
    
    static var sampleDatas: [IntroScreenData] = [
        IntroScreenData(id: 0, title: "Order from your favourite\nstores or vendors", image: "Mobile"),
        IntroScreenData(id: 1, title: "Choose from a wide range of delicious meals", image: "MealIcon"),
        IntroScreenData(id: 2, title: "Enjoy instant delivery and payment", image: "MaskBoy")]
}
