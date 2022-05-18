//
//  Prints3DCarrousel.swift
//  O-21
//
//  Created by Jorge Millan
//

import SwiftUI

struct Prints3DCarrousel: View {
    
    let title: String
    let dataModel: [ImpresionesModelView]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack{
                Text(title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
//                Rectangle()
//                    .fill(Color.red.opacity(0.3))
//                    .frame(width: 50, height: 5)
            }
            .padding(.bottom, 10)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(self.dataModel){ item in
                    NavigationLink {
                        Detail3DPrint(dataModel: [item])
                    } label: {
                        Print3DCell(model: item)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct Print3DCell: View {
    
    let model: ImpresionesModelView
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: ImpresionesModelView){
        self.model = model
        self.imageLoaderVM.loadImage(whit: self.model.imageUrl)
    }
    
    var body: some View {
        ZStack{
            if self.imageLoaderVM.image != nil {
                VStack{
                    Image(uiImage: self.imageLoaderVM.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width * 0.45, height: 200)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                        .loader(state: .ok)
                    Text(self.model.name ?? "")
                        .font(.headline)
                }
            } else {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.clear]),
                                         startPoint: .bottom,
                                         endPoint: .top))
                    .cornerRadius(20)
                    .frame(width: UIScreen.main.bounds.width * 0.45, height: 200)
                    .padding()
                    .loader(state: .loading)
            }
        }
    }
}


//struct Prints3DCarrousel_Previews: PreviewProvider {
//    static var previews: some View {
//        Prints3DCarrousel(title: "Impresion 1", dataModel: Prints3DServerModel.stubbedPrints3D.results)
//    }
//}
