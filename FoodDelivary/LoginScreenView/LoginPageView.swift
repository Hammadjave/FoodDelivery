//
//  LoginPageView.swift
//  FoodDelivary
//
//  Created by Chohan on 23/12/2023.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import Firebase

struct LoginPageView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var sheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1)
                    .ignoresSafeArea(.all)
                VStack {
                    VStack {
                        TopBarImage()
                    }
                    .padding(15)
                    Spacer()
                    
                    HStack {
                        VStack {
                            Text("Login to your account")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .frame(width: 320, alignment: .leading)
                                .padding(1)
                            Text("Good to see you again, enter your details below to continue ordering.")
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                                .frame(width: 320, alignment: .leading)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Email Address")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                            .frame(width: 350, alignment: .leading)
                        TextField("Enter email", text: $email)
                            .textFieldStyle(.plain)
                            .padding()
                            .frame(width: 334, height: 50, alignment: .leading)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(15)
                            .textInputAutocapitalization(.never)
                        
                        Text("Password")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, 30)
                        TextField("Enter password", text: $password)
                            .textFieldStyle(.plain)
                            .padding()
                            .frame(width: 334, height: 50, alignment: .leading)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(15)
                            .padding(.top, 5)
                        
                        NavigationLink(destination: ForgotPassword(), label: {
                            Spacer()
                            Text("Forgot password?")
                                .frame(alignment: .trailing)
                        })
                        .foregroundColor(.blue)
                    }
                    .padding(.top, 50)
                    .padding()
                    Spacer()
                    
                    Button(action: {
                        login()
                    }, label: {
                        Text("Login")
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .background(.orange)
                    })
                    .offset(y: -70)
                    .padding()
                    .buttonStyle(.plain)
                    
                    GoogleButton {
                        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                        
                        // Create Google Sign In configuration object.
                        let config = GIDConfiguration(clientID: clientID)
                        GIDSignIn.sharedInstance.configuration = config
                        
                        // Start the sign in flow!
                        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                            guard error == nil else {
                                return
                            }
                            
                            guard let user = result?.user,
                                  let idToken = user.idToken?.tokenString
                            else {
                                return
                            }
                            
                            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                           accessToken: user.accessToken.tokenString)
                            
                            Auth.auth().signIn(with: credential) { result, error in
                                
                                guard error == nil else {
                                    return
                                }
                                // At this point, our user is signed in
                                UserDefaults.standard.set(true, forKey: "signIn")
                            }
                        }
                    }
                    .offset(y: -40)
                    Button(action: {
                        sheet.toggle()
                    }, label: {
                        Text("Create an account")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .frame(width: 335, alignment: .top)
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
                    .fullScreenCover(isPresented: $sheet) {
                        SignUpView()
                    }
                }
//                .navigationBarBackButtonHidden(true)
            }
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            UserDefaults.standard.set(true, forKey: "signIn")
        }
    }
}

#Preview {
    LoginPageView()
}
