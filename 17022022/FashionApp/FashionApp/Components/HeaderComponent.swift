//
//  HeaderComponent.swift
//  FashionApp
//
//  Created by cice on 17/02/2022.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack{
            titleView(title: "Header Component")
            subTitleView(subTitle: "probando probando 1 2, esto funciona o no funciona")
            descriptionView(description: "Estamos con la base de la gestion de subcomponentes que hace que SwiftUI sea super ligero de entender")
        }
    }
    
    
}

struct titleView: View {
    var title: String
    var body: some View{
        Text(title)
            .padding(10)
            .font(.largeTitle)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}

struct subTitleView: View {
    var subTitle: String
    var body: some View{
        Text(subTitle)
            .padding(.horizontal, 20)
            .font(.title2)
            .foregroundColor(.black)
    }
}

struct descriptionView: View {
    var description: String
    var body: some View{
        Text(description)
            .padding([.horizontal,.top], 20)
            .font(.callout)
            .foregroundColor(.black)
            .background(Color.orange)
    }
}


struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
    }
}
