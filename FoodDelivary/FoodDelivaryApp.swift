//
//  FoodDelivaryApp.swift
//  FoodDelivary
//
//  Created by Chohan on 17/12/2023.
//

import SwiftUI
import FirebaseCore


@main
struct FoodDelivaryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDeligate
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup  {
                ContentView()
        }
    }
}
