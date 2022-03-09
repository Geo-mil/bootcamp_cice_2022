//
//  ContactosCell.swift
//  Contactos
//
//  Created by Jorge Millan on 9/3/22.
//

import SwiftUI

struct ContactosCell: View {
    var body: some View {
        HStack{
            Text("JM")
                .padding(20)
                .background(.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.title)
            VStack(alignment: .leading){
                Text("Jorge")
                    .font(.title)
                    .bold()
                Text("Millan")
                    .font(.headline)
                Text("123456789")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
        }
    }
}

struct ContactosCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactosCell()
    }
}
