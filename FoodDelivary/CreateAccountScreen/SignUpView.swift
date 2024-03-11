//
//  SignUpView.swift
//  FoodDelivary
//
//  Created by Chohan on 19/12/2023.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseAuth


struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isEmailValid: Bool = true
    @State private var errorMessage: String = ""
    @State var isError: Bool = false
    
    
    @Environment (\.dismiss) private var dismisSignUp
    
//    let topBar: IntroScreenData
    
    var signUpTextFields: Bool {
       return !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    var validationPassword: Bool {
        return password == confirmPassword
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.97, green: 0.98, blue: 1)
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        Spacer()
                            .frame(maxWidth: .infinity)
                        Image("Good")
                            .resizable()
                            .frame(width: 34, height: 23.25447)
                        Spacer()
                            .frame(maxWidth: .infinity)
                        Button("Skip", action: {
                            dismisSignUp()
                        })
                        .foregroundColor(Color(red: 0.98, green: 0.35, blue: 0.12))
                    }
                    .padding(15)
                    Spacer()
                    
                    HStack {
                        VStack {
                            Text("Create an account")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .frame(width: 320, alignment: .leading)
                                .padding(1)
                            Text("Welcome friend, enter your details so lets get started in ordering food.")
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
                            .modifier(TextFieldButtonModifier())
                            .onChange(of: email) { (_, _) in
                                validateEmail()
                            }
                        
                        if !isEmailValid {
                            Text(errorMessage)
                                .foregroundStyle(.red)
                        }
                        
                        Text("Password")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, 30)
                        TextField("Enter password", text: $password)
                            .modifier(TextFieldButtonModifier())
                        
                        Text("Confirm Password")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top, 30)
                        TextField("Confirm Password", text: $confirmPassword)
                        .modifier(TextFieldButtonModifier())
                        .onChange(of: confirmPassword) { (_, _) in
                            checkPasswordMatch()
                        }
                        if isError {
                            Text("Passwords do not matched")
                                .foregroundColor(.red)
                        }
                        VStack() {
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
                    }
                        .padding(.leading, 140)
                        .padding(.top, 20)
                        
                        VStack(alignment: .center) {
                            Button(action: {
                                checkPasswordMatch()
                                    signUp()
                                    dismisSignUp()
                                
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
                            .buttonStyle(.plain)
                            .padding(.top, 5)
                            .disabled(!signUpTextFields)
                            .disabled(!validationPassword)

                        }
                    }
                    .padding(.top, 50)
                    Spacer()
                }
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            UserDefaults.standard.set(true, forKey: "signIn")
        }
    }
    
    
    func checkPasswordMatch() {
        isError = password != confirmPassword
    }
    private func validateEmail() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: email)
        errorMessage = isEmailValid ? "Valid" : "Please enter a valid email address."
    }
   
}

#Preview {
    SignUpView()
}

struct TextFieldButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.plain)
            .padding()
            .frame(width: 334, height: 50, alignment: .leading)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(15)
    }
}


struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        
    }
}

