//
//  DetailFashionView.swift
//  FashionApp
//
//  Created by Jorge Millan on 22/2/22.
//

import SwiftUI

struct DetailFashionView: View {
    
    var model: Row
    @State private var mySize = ""
    @SwiftUI.Environment(\.presentationMode) var presenterMode//para poder hacer el dismiss
    @State private var showAlertLupa = false
    @State private var showActionSheet = false
    @State private var showCustomAlertView = false
    
    var body: some View {
        ZStack{
        ScrollView{
            VStack{
                headerInformation
                bodyInformation
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        if showCustomAlertView{
            CustomAlertView(title: "Esta es una custom Alert View",
                            message: "Esta es una alerta personalizada y se colocará encima de la vista principal y se añadirá un efecto de blur y el fondo medio opaco",
                            hideCustomAlertView: self.$showCustomAlertView)
        }
        }
    }
    
    var headerInformation: some View {
        ZStack(alignment: .topLeading) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack{
                GeometryReader{ proxy in
                    Button {
                        self.presenterMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .padding([.leading, .top], 10)
                    
                    Button {
                        self.showAlertLupa.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .offset(x: proxy.size.width - 80, y: 25)
                    .alert(isPresented: self.$showAlertLupa) {
                        Alert(title: Text("Hola soy una Alert en SwiftUI"),
                              message: Text("Aqui estamos aprendiendo como hacer una alerta en SwiftUI"),
                              primaryButton: .default(Text("OK"), action: {
                            //Acciones aqui
                        }),
                              secondaryButton: .cancel(Text("Cancel"), action: {
                            //
                        }))
                    }
                    
                    Button {
                        self.showActionSheet.toggle()
                    } label: {
                        Image(systemName: "cart")
                    }
                    .offset(x: proxy.size.width - 40, y: 25)
                    .actionSheet(isPresented: self.$showActionSheet) {
                                                ActionSheet(title: Text("A question"), message: Text("Are you sure about that?"), buttons: [
                                                    .default(Text("Yes")) { /* Pressed button Yes. Do Something */ },
                                                    .default(Text("No")) { /* Pressed button No. Do Something */ },
                                                    .default(Text("Maybe")) { /* Pressed button Maybe. Do Something */ },
                                                    .destructive(Text("Delete")) { /* Pressed button Delete. Do Something */ },
                                                    .cancel()  { /* Pressed button Cancel. Do Something */ }
                                                ])
                                        }
                }
            }
            .foregroundColor(.black)
        }
    }
    
    var bodyInformation: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                VStack{
                    Text(model.name)
                        .font(.largeTitle)
                    Text(model.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 20){
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
        
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n \n Lorem Ipsum is simply dummy text of the printing.")
                .font(.headline)
            
            Text("Select Size").font(.largeTitle)
            HStack{
                ForEach(customSize, id: \.self){ item in
                    Button{
                        self.mySize = item
                    } label : {
                        Text(item)
                            .padding()
                            .border(Color.black, width: self.mySize == item ? 1.5 : 0)
                    }
                    .foregroundColor(.black)
                }
            }
            HStack{
                Button {
                    //
                } label: {
                    Text("Add to cart")
                        .padding()
                        .border(Color.black, width: 1.5)
                }
                .foregroundColor(.black)
                
                Spacer()

                Button {
                    self.showCustomAlertView.toggle()
                } label: {
                    Text("Buy now")
                        .padding()
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(
            roundedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -30)
        )
        .padding(.top, -40)
    }
    
}

struct roundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct DetailFashionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFashionView(model: Row(id: 0,
                                     name: "Summer and Flares",
                                     image: "p1",
                                     price: "1199 €"))
    }
}
