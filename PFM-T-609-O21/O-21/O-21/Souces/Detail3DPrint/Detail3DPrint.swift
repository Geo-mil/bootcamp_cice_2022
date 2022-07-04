//
//  Detail3DPrint.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI

struct Detail3DPrint: View {
    
    let dataModel: ImpresionesModelView
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    
    var body: some View {
        ScrollView{
            VStack{
                headerView
                bodyView
            }
        }
        .padding(.horizontal, 8)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        //.padding(.bottom, 100)
    }
    
    var headerView: some View {
        ZStack(alignment: .topLeading) {
            HStack{
                Button {
                    self.presenterMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .padding()
                .background(Color.white.opacity(0.3))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                
                Spacer()

            }
            .foregroundColor(.green)
        }
    }
    
    var bodyView: some View {
        VStack(alignment: .leading, spacing: 20) {
                if self.dataModel.name != nil{
                    Text(self.dataModel.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    ZStack(alignment: .bottomLeading){
                        Print3DDetailImage(model: self.dataModel)
                        Text(self.dataModel.price ?? "")
                            .textfieldStyle()
                            .offset(x: 5, y: -5)
                    }
                    Text(self.dataModel.coments ?? "")
                        .font(.title3)
                }
            }
            .padding(.bottom, 100)
    }
}

struct Print3DDetailImage: View {
    
    let print3D: ImpresionesModelView
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: ImpresionesModelView){
        self.print3D = model
        self.imageLoaderVM.loadImage(whit: self.print3D.imageUrl)
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 10)
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
    }
}

struct Detail3DPrint_Previews: PreviewProvider {
    static var previews: some View {
        Detail3DPrint(dataModel: ImpresionesModelView(id: 0,
                                                       name: "Prueba",
                                                       imagePath: "Groru.png",
                                                       coments: "blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla",
                                                       categories: ["Star Wars","llaveros"],
                                                       price: "20€"))
    }
}
