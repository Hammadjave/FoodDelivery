//
//  Cart.swift
//  FoodDelivary
//
//  Created by Chohan on 24/02/2024.
//

import Foundation
//import Firebase

class Cart: ObservableObject {
    @Published var items: [FoodItem] = []
//    var totalPrice: Int {
//        items.reduce(0) { $0 + $1.price }
//    }
    
    func addItem(_ item: FoodItem) {
        items.append(item)
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
//    func placeOrder() {
//        let db = Firestore.firestore()
//        
//        let location = LocationManager()
//        let latitude = location.latitude
//        let longitude = location.longitude
//        
//        var order = ""
//        
//        for item in items {
//            order += item.name+", "
//        }
//        
//        let orderData: [String: Any] = [
//            "name": "Project Gurukul",
//            "location": "\(latitude), \(longitude)",
//            "total_price": totalPrice,
//            "order": order
//            
//        ]
//        db.collection("orders").addDocument(data: orderData)
//    }
}
