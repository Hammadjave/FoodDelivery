//
//  ForgotPassword.swift
//  FoodDelivary
//
//  Created by Chohan on 23/01/2024.
//

import SwiftUI
import UserNotifications

struct ForgotPassword: View {
    @State private var forgotPasswordEmail = ""
    @State private var forgotPAsswordSheet = false
    @State private var errorMessage: String = ""
    @State private var isEmailValid: Bool = true
    
    let otpCodes = ["7326", "5418", "6890", "2371", "9045", "1268", "5732", "8194", "3647", "2085", "6952", "4103", "1876", "5029", "9361", "3480", "6519", "2847", "7592", "1034"]
    
    var verifyEmail: Bool{
        return !forgotPasswordEmail.isEmpty
    }
    
    @Environment (\.dismiss) private var sheetDismiss
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 1)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Image("Good")
                        .resizable()
                        .frame(width: 34, height: 23.25447, alignment: .center)
                    Spacer()
                    Button(action: {
                        dismisView()
                    }, label: {
                        Text("Cancel")
                            .underline()
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.98, green: 0.35, blue: 0.12))
                    })
                }
                .padding()
                Spacer()
                
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
                VStack {
                    Text("Email Address")
                        .frame(width: 350, alignment: .leading)
                    TextField("Enter email", text: $forgotPasswordEmail)
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 334, height: 50, alignment: .leading)
                        .background(.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.87, green: 0.89, blue: 0.9), lineWidth: 1)
                            
                        )
                        .onChange(of: forgotPasswordEmail) { (_, _) in
                            validateEmail()
                        }
                    if !isEmailValid {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    Button(action: {
                        forgotPAsswordSheet.toggle()
                        
                        let content = UNMutableNotificationContent()
                        
                        if let randomOTP = otpCodes.randomElement() {
                            content.title = "Your OTP Code"
                            content.body = "Use this code for verification: \(randomOTP)"
                            
                            content.sound = UNNotificationSound.default
                            
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            
                            UNUserNotificationCenter.current().add(request)
                        } else {
                            // Handle the case where otpCodes array is empty
                            print("Error: Unable to generate OTP. otpCodes array is empty.")
                        }
                    }, label: {
                        Text("Send OTP")
                            .padding()
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.98, green: 0.53, blue: 0.12), location: 0.00),
                                        Gradient.Stop(color: Color(red: 1, green: 0.47, blue: 0.3), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.42, y: -0.3),
                                    endPoint: UnitPoint(x: 0.54, y: 1.54)
                                )
                            )
                            .cornerRadius(20)
                            .shadow(color: Color(red: 0.79, green: 0.26, blue: 0.07).opacity(0.1), radius: 15, x: 0, y: 10)
                    })
                    .foregroundColor(.white)
                    .cornerRadius(6.0)
                    .disabled(!verifyEmail)
                    .sheet(isPresented: $forgotPAsswordSheet) {
                        OTPField(numberofField: 4)
                    }
                }
                .padding(.top, 150)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
                    requestNotificationAuthorization()
                }
    }
    private func dismisView() {
        sheetDismiss()
    }
    func sendPushNotification(otp: String) {
           
            }
        

    func requestNotificationAuthorization() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if let error = error {
                    print("Error requesting notification authorization: \(error.localizedDescription)")
                }
            }
        }
    private func validateEmail() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: forgotPasswordEmail)
        errorMessage = isEmailValid ? "Valid" : "Please enter a valid email address."
    }
}

#Preview {
    ForgotPassword()
}
