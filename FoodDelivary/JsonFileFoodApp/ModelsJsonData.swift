//
//  ModelsJsonData.swift
//  FoodDelivary
//
//  Created by Chohan on 31/01/2024.
//
import Foundation

struct FoodItem: Identifiable, Equatable, Decodable {
    let id = UUID()
    let name: String
    let description: String
    let price: Int
    let image: String
    
}