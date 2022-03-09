//
//  ContentView.swift
//  Contactos
//
//  Created by Jorge Millan on 9/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ContactosCell()
                }
                NavigationLink(destination: AgregarContactoView()) {
                    HStack(spacing: 20){
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Guardar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(.green)
                    .clipShape(Capsule())
                }
            }
            .navigationTitle("Contactos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
