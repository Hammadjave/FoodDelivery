//
//  DecodeJsonFile.swift
//  FoodDelivary
//
//  Created by Chohan on 03/02/2024.
//

import Foundation
class DecodeFile: ObservableObject {
    @Published private var foodItem = [FoodItem]()
    
    func fetchingJsonData() {
        foodItem = readJsonData()
    }
    
    private func readJsonData() -> [FoodItem] {
        if let fileName = Bundle.main.url(forResource: "food", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileName)
                let decoder = JSONDecoder()
                let food = try decoder.decode([FoodItem].self, from: data)
                return food
            } catch {
                return []
            }
        } else {
            return []
        }
    }
}


