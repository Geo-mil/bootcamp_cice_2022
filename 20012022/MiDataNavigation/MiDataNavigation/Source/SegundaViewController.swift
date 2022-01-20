//
//  SegundaViewController.swift
//  MiDataNavigation
//
//  Created by cice on 20/01/2022.
//

import UIKit

class SegundaViewController: UIViewController {

    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    var edadPerro: Int?
    var nuevaEdadPerro: Int?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    
    @IBOutlet weak var miTelefonoTF: UITextField!
    @IBOutlet weak var miDireccionTF: UITextField!
    @IBOutlet weak var edadPerroTF: UITextField!
    
    // MARK: - IBActions
    @IBAction func calculoEdadPerroACTION(_ sender: UIButton){
        self.edadPerro = Int(self.edadPerroTF.text ?? "0")
        
        if let edadPerroUnw = self.edadPerro {
            self.nuevaEdadPerro = edadPerroUnw * 7
            self.present(Utils.shared.showAlertVC(title: "Edad de mi perro",
                                                  message: "El calculo de la edad de mi perro es: \(self.nuevaEdadPerro ?? 0)"),
                         animated: true,
                         completion: nil)
        }else{
            self.present(Utils.shared.showAlertVC(title: "Estimado usuario",
                                                  message: "Por favor, introduce la edad de tu perro para calcularla"),
                         animated: true,
                         completion: nil)
        }
    }
    
    // MARK: - IBOutlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(self.datosUsuario.nombreData ?? "")
        debugPrint(self.datosUsuario.apellidoData ?? "")
        // Do any additional setup after loading the view.
        configuracionUI()
    }
    
    private func configuracionUI(){
        self.miNombreLBL.text =  "Mi nombre es:  \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi apellido es: \(self.datosUsuario.apellidoData ?? "")"
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "segueV3"{
            if !(self.miTelefonoTF.text?.isEmpty ?? false) &&
                !(self.miDireccionTF.text?.isEmpty ?? false) &&
                !(self.edadPerroTF.text?.isEmpty ?? false){
                _ = segue.destination as? TerceraViewController
            }else{
                self.present(Utils.shared.showAlertVC(title: "Hey!!",
                                                      message: "Por favor introduce todos los datos"),
                             animated: true,
                             completion: nil)
            }
        }
    }
    

}
