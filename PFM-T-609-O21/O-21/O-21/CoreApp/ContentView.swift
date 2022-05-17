//
//  ContentView.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    var body: some View {
        if self.viewModelSession.userLogged != nil {
            HomeView()
        }else{
            LoginView(authType: .singUp)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
