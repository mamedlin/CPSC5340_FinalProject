//
//  ContentView.swift
//  GOTWiki
//
//  Created by Michael Medlin on 4/23/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var isShowingLogin = true
    @State private var isLoggedIn = false


    var body: some View {
        VStack {
            
            if isShowingLogin {
                LoginView(isShowingLogin: $isShowingLogin, isLoggedIn: $isLoggedIn)
                    .transition(.slide)
            }
            else if isLoggedIn {
                WelcomeView(isShowingLogin: $isShowingLogin, isLoggedIn: $isLoggedIn)
                    .transition(.slide)
            }
            else {
                SignUpView(isShowingLogin: $isShowingLogin)
                    .transition(.slide)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
