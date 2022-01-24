//
//  Utils.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 24/01/2022.
//

import UIKit

protocol ReuseIdenfierView: AnyObject {
    static var defaultReuseIdentifier: String {get}
}

extension ReuseIdenfierView where Self: UIView {
    static var defaultReuseIdentifier: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

class Utils{
    struct Constants {
        let tituloListaMeses = "Meses"
        let tituloListaCoches = "Coches"
    }
}
