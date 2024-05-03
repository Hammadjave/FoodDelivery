//
//  forgotPAsswordCheck.swift
//  FoodDelivary
//
//  Created by Chohan on 01/04/2024.
//

import SwiftUI
import FirebaseAuth

struct forgotPAsswordCheck: View {
    @State private var email: String = ""
       @State private var showAlert = false
       @State private var alertMessage = ""
    var body: some View {
        VStack {
            Text("Forgot password")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.11, green: 0.11, blue: 0.11))
                .padding(.top, 10)
                .padding()
            
            Text("Enter your email address to request a password reset.")
                .font(Font.custom("Sk-Modernist", size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
                .padding(.top, 0)
            
                   TextField("Enter your email", text: $email)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
                   
                   Button(action: resetPassword) {
                       Text("Reset Password")
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.blue)
                           .cornerRadius(10)
                   }
                   .padding()
               }
               .alert(isPresented: $showAlert) {
                   Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
               }
           }

           func resetPassword() {
               Auth.auth().sendPasswordReset(withEmail: email) { error in
                   if let error  {
                       self.alertMessage = error.localizedDescription
                       self.showAlert = true
                   } else {
                       self.alertMessage = "Password reset email sent successfully!"
                       self.showAlert = true
                   }
               }
    }
}

#Preview {
    forgotPAsswordCheck()
}
