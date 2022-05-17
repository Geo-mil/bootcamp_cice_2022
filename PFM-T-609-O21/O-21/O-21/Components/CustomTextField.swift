//
//  CustomTextField.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI

struct CustomTextField: View {
    
    var image: String
    var placeholder: String
    var title: String
    var text: Binding<String>
    var secure: Bool
    
    var body: some View {
        HStack{
            Image(systemName: image)
                .padding(.top, 15)
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.gray)
                    .offset(y: text.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                if(secure){
                    SecureField(placeholder, text: text)
                        .foregroundColor(.black)
                }else{
                    TextField(placeholder, text: text)
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 15)
            .animation(.spring(response: 0.2,
                               dampingFraction: 0.5,
                               blendDuration: 0.3),
                       value: text.wrappedValue.isEmpty)
        }
    
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(image: "person", placeholder: "email", title: "email", text: .constant(""), secure: false)
            .previewInterfaceOrientation(.portrait)
    }
}
