//
//  LoginView.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State var authType: AuthenticationType
    
    @State var email = ""
    @State var password = ""
    @State var passwordConfirmation = ""
    @State var showpassword = false
    
    var body: some View {
        ZStack{
            VStack(spacing:20){
                helloApp
                imageAppLogo
                
                //comprobar si el usuario está autentificado en firebase
                if !self.viewModelSession.userAuthenticated {
                    VStack(spacing: 20){
                        CustomTextField(image: "person",
                                        placeholder: "email",
                                        title: "email",
                                        text: self.$email,
                                        secure: false)
                             .textfieldStyle()
                        
                        CustomTextField(image: "lock",
                                        placeholder: "password",
                                        title: "password",
                                        text: self.$password,
                                        secure: !showpassword)
                            .textfieldStyle()
                        
                        if authType == .singUp {
                            CustomTextField(image: "lock",
                                            placeholder: "password confirmation",
                                            title: "password confirmation",
                                            text: self.$passwordConfirmation,
                                            secure: !showpassword)
                            .textfieldStyle()
                        }
                        
                        Toggle("show password", isOn: self.$showpassword)
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .padding(.vertical)
                }
                
                // Boton del Login / Registro
                Button {
                    self.authEmailTouched()
                } label: {
                    Text(self.authType.text)
                        .buttonStyleH1()
                }
                .foregroundColor(.gray)
                
                Button {
                    self.footerTouched()
                } label: {
                    Text(self.authType.footerText)
                        .buttonStyleH1()
                }
                .foregroundColor(.gray)
            }
            .padding()
        }
    }
    
    var helloApp: some View {
        Text("T-609/O-21")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
    }
    
    var imageAppLogo: some View {
        Image("Logo_R3D")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
    }
    
    private func authEmailTouched(){
        switch authType {
        case .singIn:
            self.viewModelSession.signIn(with: .emailAndPassword(email: self.email, password: self.password))
        case .singUp:
            self.viewModelSession.signUp(email: self.email, password: self.password, passwordConfirmation: self.passwordConfirmation)
        }
    }
    
    private func footerTouched(){
        self.authType = authType == .singUp ? .singIn : .singUp
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authType: .singUp)
    }
}
