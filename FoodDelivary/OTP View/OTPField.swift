//
//  OTPField.swift
//  FoodDelivary
//
//  Created by Chohan on 22/01/2024.
//

import SwiftUI

struct OTPField: View {
    let numberofField: Int
    @State private var enterValue: [String]
    @State private var oldValue = ""
    @FocusState private var fieldFocus: Int?
    
    init(numberofField: Int) {
        self.numberofField = numberofField
        self.enterValue = Array(repeating: "", count: numberofField)
    }
    var body: some View {
        VStack {
            VStack {
                Text("Reset Password")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Text("A reset code has been sent to your email")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                Text("Enter code")
                    .font(.system(size: 12))
            }
            HStack {
                ForEach(0..<4) { field in
                    TextField("", text: $enterValue[field], onEditingChanged: { editing in
                        if editing {
                            oldValue = enterValue[field]
                        }
                    })
                        .keyboardType(.numberPad)
                        .frame(width: 48, height: 48)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                        .multilineTextAlignment(.center)
                        .focused($fieldFocus, equals: field)
                        .tag(field)
                        .onChange(of: enterValue[field]) { _, newValue in
                            if enterValue[field].count > 1 {
                                let currentValue = Array(enterValue[field])
                                if currentValue[0] == Character(oldValue) {
                                    enterValue[field] = String(enterValue[field].suffix(1))
                                } else {
                                    enterValue[field] = String(enterValue[field].prefix(1))
                                }
                            }
                            if !newValue.isEmpty {
                                if field == numberofField - 1 {
                                    fieldFocus = nil
                                } else {
                                    fieldFocus = (fieldFocus ?? 0) + 1
                                }
                            } else {
                                fieldFocus = (fieldFocus ?? 0) - 1
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    OTPField(numberofField: 4)
}
