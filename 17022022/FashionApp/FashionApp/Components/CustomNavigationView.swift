//
//  CustomNavigationView.swift
//  FashionApp
//
//  Created by Jorge Millan on 21/2/22.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @State private var showAlert = false
    @State private var showAlertDos = false
    @Binding var showAlertTres: Bool
    
    var body: some View {
        ZStack{
            Text("Seasons").font(.system(size: 20))
            HStack(spacing: 8){
                Button{
                    self.showAlert.toggle()
                } label:{
                    Image(systemName: "slider.horizontal.3")
                }
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("Hola soy una Alert en SwiftUI"),
                          message: Text("Aqui estamos aprendiendo como hacer una alerta en SwiftUI"),
                          primaryButton: .default(Text("OK"), action: {
                        //Acciones aqui
                    }),
                          secondaryButton: .cancel(Text("Cancel"), action: {
                        //
                    }))
                }
                
                Spacer()
                
                Button{
                    self.showAlertDos.toggle()
                } label:{
                    Image(systemName: "magnifyingglass")
                }
                .alert("Esta es una segunda alerta en Xcode12", isPresented: self.$showAlertDos) {
                    Button("OK"){
                        //acciones aqui
                    }
                    Button(role: .cancel) {
                        //aqui la accion
                    } label: {
                        Text("Cancel")
                    }

                }
                
                Button{
                    //Aqui se ejecuta la accion del boton
                    self.showAlertTres.toggle()
                } label:{
                    Image(systemName: "alarm")
                }
                
            }
            .padding(.horizontal, 8)
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(showAlertTres: .constant(false))
    }
}
