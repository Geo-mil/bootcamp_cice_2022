//
//  CustomAlertView.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI

struct CustomAlertView: View {
    
    var title: String
    var message: String
    //var imageURL: URL
    @State var hideCustomAlertView: Binding<Bool>
    //@ObservedObject var imageLoaderVM = ImageLoader()
    
    //init(title: String, message: String, imageURL: URL, hideCustomAlertView: Binding<Bool>){
    init(title: String, message: String, hide: Binding<Bool>){
        self.title = title
        self.message = message
        //self.imageURL = imageURL
        self.hideCustomAlertView = hide
        //self.imageLoaderVM.loadImage(whit: self.imageURL)
    }
    
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
                        // Aqui va la accion del Binding
                        self.hideCustomAlertView.wrappedValue.toggle()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                Divider()
                Text(message)
                    .font(.custom("Arial", size: 18))
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.90)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(title: "Ha habido un error",
                        message: "Si ya está registrado, intente introducir de nuevo su nombre de ususario y contraseña",
                        //imageURL: nil,
                        hide: .constant(true)
        )
    }
}
