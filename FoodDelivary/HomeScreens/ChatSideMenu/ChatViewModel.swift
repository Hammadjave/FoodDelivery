//
//  ChatViewModel.swift
//  FoodDelivary
//
//  Created by Chohan on 03/05/2024.
//

import Foundation

let messageResponseDictionary = ["Goodbye": "Talk to you later",
                                 "How are you?": "I'm doing well, thank you. How about yourself?"]

func getResponseBot(message: String) -> String {
    return messageResponseDictionary[message] ?? "Something Went Wrong"
}
