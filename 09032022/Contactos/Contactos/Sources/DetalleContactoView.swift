//
//  DetalleContactoView.swift
//  Contactos
//
//  Created by Jorge Millan on 10/3/22.
//

import SwiftUI

struct DetalleContactoView: View {
    
    @SwiftUI.Environment(\.presentationMode) var presentedMode
    var data: Contactos
    
    var body: some View {
        VStack{
            Text(self.data.iniciales)
                .circularButton(fontFamily: "Arial",
                                fontSize: 100, foregroundColor: .white, backgroundColor: .gray, padding: 50)
            Text(self.data.nombre)
                .font(.title)
                .bold()
            Text(self.data.apellido)
                .font(.headline)
            Text(self.data.telefono)
                .font(.largeTitle)
            
            HStack{
                Button {
                    guard let numero = URL(string: "tel://" + self.data.telefono) else {return}
                    UIApplication.shared.open(numero,
                                              options: [:],
                                              completionHandler: nil)
                } label: {
                    Image(systemName: "phone.fill")
                        .circularButton(fontFamily: "Arial", fontSize: 30, foregroundColor: .white, backgroundColor: .green, padding: 30)
                }
                
                NavigationLink{
                    AgregarContactoView(esEdicion: true, data: self.data)
                } label: {
                    Image(systemName: "pencil")
                        .circularButton(fontFamily: "Arial", fontSize: 30, foregroundColor: .white, backgroundColor: .green, padding: 30)
                }

            }
        }
    }
}

struct DetalleContactoView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleContactoView(data: Contactos())
    }
}
