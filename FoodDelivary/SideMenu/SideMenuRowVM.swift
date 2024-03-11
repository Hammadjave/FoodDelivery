//
//  SideMenuRowVM.swift
//  FoodDelivary
//
//  Created by Chohan on 01/02/2024.
//

import Foundation
enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case favorite
    case chat
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"

        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .favorite:
            return "favorite"
        case .chat:
            return "chat"
        case .profile:
            return "profile"

        }
    }
}
