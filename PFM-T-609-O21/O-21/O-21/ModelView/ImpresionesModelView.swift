//
//  ImpresionesModelView.swift
//  O-21
//
//  Created by Jorge Millan
//

import Foundation

struct ImpresionesModelView: Identifiable {
    
    let id: Int?
    let name: String?
    let imagePath: String?
    let coments: String?
    let categories: [String]?
    let price: String?
    
    var imageUrl: URL {
        return URL(string: "https://firebasestorage.googleapis.com/v0/b/r3dapp-a61b3.appspot.com/o/\(imagePath ?? "")")!
    }
    
}
