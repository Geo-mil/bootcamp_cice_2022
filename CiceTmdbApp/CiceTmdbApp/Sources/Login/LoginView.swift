//
//  LoginView.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 3/3/22.
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
            VStack(spacing: 40){
                helloApp
                imageAppLogo
                //Haremos una comprobacion para saber si el usuario esta autentificado en firebase
                if !self.viewModelSession.userAuthenticated {
                    VStack(spacing: 20){
                       CustomTextField(placeholder: "email",
                                       title: "email",
                                       text: self.$email)
                            .padding(10)
                            .background(
                                Color(red: 239/255,
                                      green: 243/255,
                                      blue: 244/255,
                                      opacity: 1)
                            )
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        
                        if self.showpassword{
                            CustomTextField(placeholder: "password",
                                            title: "password",
                                            text: self.$password)
                                 .padding(10)
                                 .background(
                                     Color(red: 239/255,
                                           green: 243/255,
                                           blue: 244/255,
                                           opacity: 1)
                                 )
                                 .cornerRadius(10)
                                 .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        }else{
                            CustomSecureTextField(placeholder: "password",
                                                  title: "password",
                                                  text: self.$password)
                                .padding(10)
                                .background(
                                    Color(red: 239/255,
                                          green: 243/255,
                                          blue: 244/255,
                                          opacity: 1)
                                )
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        }
                        
                        if authType == .singUp{
                            if showpassword {
                                CustomTextField(placeholder: "passwordConfirmation",
                                                title: "passwordConfirmation",
                                                text: self.$passwordConfirmation)
                                     .padding(10)
                                     .background(
                                         Color(red: 239/255,
                                               green: 243/255,
                                               blue: 244/255,
                                               opacity: 1)
                                     )
                                     .cornerRadius(10)
                                     .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                            }else{
                                CustomSecureTextField(placeholder: "passwordConfirmation",
                                                      title: "passwordConfirmation",
                                                      text: self.$passwordConfirmation)
                                    .padding(10)
                                    .background(
                                        Color(red: 239/255,
                                              green: 243/255,
                                              blue: 244/255,
                                              opacity: 1)
                                    )
                                    .cornerRadius(10)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 5, y: 5)
                            }
                        }
                        
                        Toggle("show password", isOn: self.$showpassword)
                            .padding()
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        // Boton del Login / Registro
                        Button {
                            self.authEmailTouched()
                        } label: {
                            Text(self.authType.text)
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255,
                                          green: 243/255,
                                          blue: 244/255)
                                )
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                        
                        // Boton del Login / Registro
                        Button {
                            self.footerTouched()
                        } label: {
                            Text(self.authType.footerText)
                                .font(.headline)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                                .background(
                                    Color(red: 239/255,
                                          green: 243/255,
                                          blue: 244/255)
                                )
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                        

                    }
                }
            }
            .padding()
        }
    }
    
    var helloApp: some View {
        Text("Cice TMDB App")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
    }
    
    var imageAppLogo: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 20)
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
            .overlay(
                Circle()
                    .stroke(Color.red, lineWidth: 2)
            )
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
