//
//  CustomAlertView.swift
//  FashionApp
//
//  Created by Jorge Millan on 21/2/22.
//

import SwiftUI

struct CustomAlertView: View {
    
    var title: String
    var message: String
    @Binding var hideCustomAlertView: Bool
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                HStack{
                    Spacer()
                    Text(title)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button {
                        //accion del binding
                        self.hideCustomAlertView.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                Divider()
                Text(message)
                    .font(.custom("Arial", size: 16))
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(title: "Aqui Jorge", message: "Aprendiendo a crear una alerta personalizada", hideCustomAlertView: .constant(true))
    }
}
