//
//  LoginView.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/23/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @Binding var isShowingLogin: Bool
    @Binding var isLoggedIn: Bool

    var body: some View {
            NavigationView {
                ZStack {
                    // Background image
                    Image("parchmentpaper")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.7)

                    VStack(spacing: 20) {
                        
                        Image("gotlogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 200)
                        
                        
                        Text("Welcome!")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .offset(x: -90)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .frame(maxWidth: 350)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .frame(maxWidth: 350)

                        Button("Login") {
                            loginUser()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                        if let message = errorMessage {
                            Text(message)
                                .foregroundColor(.red)
                                .frame(maxWidth: 350)
                        }
                        Button(isShowingLogin ? "Sign Up" : "Login") {

                            isShowingLogin.toggle()
                        }
                        
                        Spacer()

                    }
                    .padding()
                }
            }
        }

    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                if let user = Auth.auth().currentUser {
                    let userEmail = user.email
                    UserDefaults.standard.set(userEmail, forKey: "userEmail")
                }
                isLoggedIn.toggle()
                isShowingLogin.toggle()

                errorMessage = nil
                email = ""
                password = ""
            }
        }
    }
}
