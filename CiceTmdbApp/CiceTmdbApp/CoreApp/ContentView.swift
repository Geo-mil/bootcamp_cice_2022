//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 22/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    var body: some View {
        VStack{
            if currentPage > Constants.totalPages{
                if self.viewModelSession.userLogged != nil {
                    HomeView()
                }else{
                    LoginView(authType: .singUp)
                }
            }else{
                OnboardingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
