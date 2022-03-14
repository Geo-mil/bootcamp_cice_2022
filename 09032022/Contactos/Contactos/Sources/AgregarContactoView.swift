//
//  AgregarContactoView.swift
//  Contactos
//
//  Created by Jorge Millan on 9/3/22.
//

import SwiftUI
import UserNotifications

struct AgregarContactoView: View {
    
    //MARK: - ICD
    @Environment(\.managedObjectContext) private var viewContext
    @SwiftUI.Environment(\.presentationMode) var presentedMode
    
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var direccion = ""
    @State private var edad = ""
    @State private var mail = ""
    @State private var genero = ""
    @State private var telefono = ""
    @State private var iniciales = ""
    
    var esEdicion = false
    var data: Contactos?
    
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
                    if esEdicion{
                        self.editarContacto()
                    } else {
                        self.salvarContacto()
                        self.localNotification()
                    }
                    
                } label: {
                    HStack(spacing: 20){
                        Image(systemName: esEdicion ? "pencil" : "person.crop.circle")
                            .foregroundColor(.white)
                            .font(.title)
                        Text(esEdicion ? "Editar contacto" : "Guardar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                }
            }
            .onAppear(perform: {
                if esEdicion{
                    self.nombre = data?.nombre ?? ""
                    self.apellido = data?.apellido ?? ""
                    self.direccion = data?.direccion ?? ""
                    self.mail = data?.email ?? ""
                    self.telefono = data?.telefono ?? ""
                    self.genero = data?.genero ?? ""
                    self.edad = data?.edad ?? ""
                }
            })
            .padding(10)
        }
        .navigationTitle("Agregar Contacto")
    }
    
    // MARK: Private methods
    private func salvarContacto(){
        //accedemos a la entidad que contiene la base de datos
        let nuevoContacto = Contactos(context: self.viewContext)
        let inicialN = String(self.nombre.first ?? "A")
        let inicialA = String(self.apellido.first ?? "A")
        
        nuevoContacto.nombre = self.nombre
        nuevoContacto.apellido = self.apellido
        nuevoContacto.direccion = self.direccion
        nuevoContacto.edad = self.edad
        nuevoContacto.email = self.mail
        nuevoContacto.genero = self.genero
        nuevoContacto.telefono = self.telefono
        nuevoContacto.iniciales = inicialN + inicialA
        
        do{
            try self.viewContext.save()
            print("salvado correctamente")
            self.presentedMode.wrappedValue.dismiss()
        }catch let error as NSError{
            print("error al salvar datos", error.localizedDescription)
        }
    }
    
    private func editarContacto(){
        let inicialN = String(self.nombre.first ?? "A")
        let inicialA = String(self.apellido.first ?? "A")
        
        self.data?.nombre = self.nombre
        self.data?.apellido = self.apellido
        self.data?.direccion = self.direccion
        self.data?.email = self.mail
        self.data?.telefono = self.telefono
        self.data?.genero = self.genero
        self.data?.edad = self.edad
        self.data?.iniciales = inicialN + inicialA
        
        do{
            try self.viewContext.save()
            print("salvado correctamente")
            self.presentedMode.wrappedValue.dismiss()
        }catch let error as NSError{
            print("error al salvar datos", error.localizedDescription)
        }
    }
    
    private func localNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
            //
        }
        
        // contenido
        let contenido = UNMutableNotificationContent()
        contenido.title = "Mi notificacion"
        contenido.subtitle = "Mi subtitulo de notificacion"
        contenido.body = "Esta es una notificación local para Swift UI"
        contenido.sound = .defaultCritical
        contenido.badge = 1
        
        // imagen
        if let path = Bundle.main.path(forResource: "emoji", ofType: "jpeg"){
            let url = URL(fileURLWithPath: path)
            do{
                let image = try UNNotificationAttachment(identifier: "emoji", url: url, options: nil)
                contenido.attachments = [image]
            } catch {
                print("no carga la imagen")
            }
        }
        
        //botones
        let boton1 = UNNotificationAction(identifier: "boton1", title: "Abrir la vista detalle", options: .foreground)
        let cancel = UNNotificationAction(identifier: "cancelar", title: "Cancelar", options: .destructive)
        
        let categoria = UNNotificationCategory(identifier: "acciones", actions: [boton1, cancel], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([categoria])
        contenido.categoryIdentifier = "acciones"
        
        //disparador
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "noti", content: contenido, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

struct AgregarContactoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarContactoView(data: Contactos())
    }
}
