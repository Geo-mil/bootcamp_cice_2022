//
//  AgregarContactoView.swift
//  Contactos
//
//  Created by Jorge Millan on 9/3/22.
//

import SwiftUI

struct AgregarContactoView: View {
    
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var direccion = ""
    @State private var edad = ""
    @State private var mail = ""
    @State private var genero = ""
    @State private var telefono = ""
    @State private var iniciales = ""
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                TextField("Nombre", text: self.$nombre)
                    .textFieldStyle()
                TextField("Apellido", text: self.$apellido)
                    .textFieldStyle()
                TextField("Direccion", text: self.$direccion)
                    .textFieldStyle()
                TextField("Edad", text: self.$edad)
                    .textFieldStyle()
                    .keyboardType(.phonePad)
                TextField("Email", text: self.$mail)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                TextField("Genero", text: self.$genero)
                    .textFieldStyle()
                TextField("Teléfono", text: self.$telefono)
                    .textFieldStyle()
                    .keyboardType(.phonePad)
                
                Button {
                    //salvar los datos en coredata
                } label: {
                    HStack(spacing: 20){
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Guardar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                }
            }
            .padding(10)
        }
        .navigationTitle("Agregar Contacto")
    }
}

struct AgregarContactoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarContactoView()
    }
}
