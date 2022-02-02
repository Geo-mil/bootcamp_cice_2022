//
//  Utils.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit
import MessageUI

class Utils {
    
    struct Constantes {
        let kUsername = "USERNAME"
        let kPassword = "PASSWORD"
        let kUsuarioLogueado = "LOGUEADO"
        let kPrefs = UserDefaults.standard
        let kImageProfile = "IMAGE_PROFILE"
    }
    
    static func muestraAlerta(titulo: String, mensaje: String, completionHandler: ((UIAlertAction)->())?) -> UIAlertController{
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: completionHandler))
        return alertVC
    }
    
    static func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, data: ArrayContact?)-> MFMailComposeViewController{
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = delegate
        mailCompo.setToRecipients(["info@mail.com","mail@mail.com"])
        mailCompo.setSubject("este es el mensaje para el equipo de soporte")
        let mailBody = "Los datos del formulario de registro son \(data?.firstName)"
        mailCompo.setMessageBody(mailBody, isHTML: false)
        return mailCompo
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

