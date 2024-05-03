//
//  FavouriteItemsModel.swift
//  FoodDelivary
//
//  Created by Chohan on 12/03/2024.
//

import Foundation

class FavouriteFoodItems: ObservableObject {
    @Published var favtItem: [FoodItem] = []
    
    func addFavtItems(_ favt: FoodItem) {
        if let itemIndex = favtItem.firstIndex(where: { $0.id == favt.id})  {
            favtItem.remove(at: itemIndex)
        } else {
            favtItem.append(favt)            
        }
    }
}


extension Notification.Name {
    static let favtItemNotivication = Notification.Name("FavtItems")
}
