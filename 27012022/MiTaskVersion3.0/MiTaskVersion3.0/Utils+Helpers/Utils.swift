//
//  Utils.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

class Utils {
    
    struct Constantes {
        let kUsername = "USERNAME"
        let kPassword = "PASSWORD"
        let kUsuarioLogueado = "LOGUEADO"
        let kPrefs = UserDefaults.standard
    }
    
    static func muestraAlerta(titulo: String, mensaje: String, completionHandler: ((UIAlertAction)->())?) -> UIAlertController{
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: completionHandler))
        return alertVC
    }
}

protocol ReuseIdentifierProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

