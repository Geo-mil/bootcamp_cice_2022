//
//  CuartaViewController.swift
//  MiDataNavigation
//
//  Created by cice on 20/01/2022.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {
    
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()

    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    @IBOutlet weak var miCodigoPostaLBL: UILabel!
    @IBOutlet weak var miCiudadLBL: UILabel!
    @IBOutlet weak var miPosicionGeoLBL: UILabel!
    
    // MARK - IBAction
    @IBAction func enviarTodaLaInfoMailACTION(_ sender: UIButton){
        
        if MFMailComposeViewController.canSendMail(){
            self.present(self.configuarcionMailCompose(), animated: true, completion: nil)
        }else{
            self.present(Utils.shared.showAlertVC(title: "¡Imposible!", message: "Estas en el simulador"), animated: true,completion: nil)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI(){
        self.miNombreLBL.text = datosUsuario.nombreData
        self.miApellidoLBL.text = datosUsuario.apellidoData
        self.miTelefonoLBL.text = datosUsuario.telefonoData
        self.miDireccionLBL.text = datosUsuario.direccionData
        self.edadPerroLBL.text = datosUsuario.edadPerroData
        self.miCodigoPostaLBL.text = datosUsuario.codigoPostalData
        self.miCiudadLBL.text = datosUsuario.ciudadData
        self.miPosicionGeoLBL.text = datosUsuario.posicionGeograficaData
    }
    
    private func configuarcionMailCompose () -> MFMailComposeViewController{
        
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = self
        mailCompo.setToRecipients(["info@mail.com"])
        mailCompo.setSubject("este es un mensaje para el equipo de soporte")
        let emailBody = "Los datos del formulario de registro son \(datosUsuario.nombreData ?? "") \n \(self.miApellidoLBL.text ?? "")"
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }

}
extension CuartaViewController: MFMailComposeViewControllerDelegate{
    
    func mailComposeController (_ controller: MFMailComposeViewController,didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true,completion: nil)
    }
}
