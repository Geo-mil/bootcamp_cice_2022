//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 3/3/22.
//

import Foundation
import FirebaseAuth

enum LoginOption{
    case sessionWithApple
    case emailAndPassword(email: String, password: String)
}

enum AuthenticationType: String {
    
    case singIn
    case singUp
    
    var text: String{
        rawValue.capitalized
    }
    
    var footerText: String {
        switch self{
        case .singIn:
            return "not a member yet, register"
        case .singUp:
            return "Are you ready for Cice TMDB App?"
        }
    }
}

final class LoginViewModel: ObservableObject {
    
    @Published var userLogged: User?
    @Published var userAuthenticated = false
    @Published var error: NSError?
    
    private let authenticationData = Auth.auth()
    
    required init() {
        userLogged = authenticationData.currentUser
        authenticationData.addStateDidChangeListener(stateAuthenticationModified)
    }
    
    private func stateAuthenticationModified(with auth: Auth, user: User?) {
        guard user != self.userLogged else { return }
        self.userLogged = user
    }
    
    //Login
    func signIn(with loginOption: LoginOption){
        self.userAuthenticated = true
        self.error = nil
        switch loginOption {
        case .sessionWithApple:
            print("loging con Apple")
        case let .emailAndPassword(email, password):
            authenticationData.signIn(withEmail: email, password: password, completion: handlerAuthenticationState)
        }
    }
    
    //SignUp
    func signUp(email: String, password: String, passwordConfirmation: String){
        guard password == passwordConfirmation else {
            self.error = NSError(domain: "", code: 9210, userInfo: [NSLocalizedDescriptionKey: "El password y la confirmacion no coinciden"])
            return
        }
        self.userAuthenticated = true
        self.error = nil
        authenticationData.createUser(withEmail: email, password: password, completion: handlerAuthenticationState)
    }
    
    //logout
    func logoutSession(){
        do{
            try authenticationData.signOut()
        }catch{
            self.error = NSError(domain: "", code: 9999, userInfo: [NSLocalizedDescriptionKey: "El usuario no ha logrado cerrar sesion"])
        }
    }
    
    //handler
    private func handlerAuthenticationState(with auth: AuthDataResult?, and error: Error?){
        DispatchQueue.main.async {
            self.userAuthenticated = false
            if let user = auth?.user{
                self.userLogged = user
            } else if let errorUnw = error {
                self.error = errorUnw as NSError
            }
        }
    }
}
