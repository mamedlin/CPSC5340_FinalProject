//
//  WelcomeView.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/23/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct WelcomeView: View {
    @Binding var isShowingLogin: Bool
    @Binding var isLoggedIn: Bool
    let userEmail: String? = UserDefaults.standard.string(forKey: "userEmail")

    @StateObject private var viewModel = CharactersViewModel()
    
    

    var body: some View {
        NavigationView {
            
            ZStack {

                Image("parchmentpaper")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
            
                VStack {
                    
                    
                    Text("Welcome,")
                        .font(.largeTitle)
                        .padding()
                        .frame(maxWidth: 350)
                        .bold()
                    
                    Text("\(userEmail ?? "")!")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: 350)
                    
                    Spacer()
                    
                    NavigationLink(destination: CharactersView()) {
                        Text("View GOT Characters")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    
                    NavigationLink(destination: SavedCharactersView()) {
                        Text("View Saved GOT Characters")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("Logout") {
                        logout()
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "userEmail")
            isLoggedIn.toggle()
            isShowingLogin.toggle()

        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

