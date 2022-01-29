//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK - Variables globales
    var usuarioLogueado = false
    //MARK - IBOutlet
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var contentViewUserName: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBAction func rememberACTION(_ sender: Any) {
        if datosCompletados(){
            self.usuarioLogueado = true
            Utils.Constantes().kPrefs.setValue(self.userNameTF.text, forKey: Utils.Constantes().kUsername)
            Utils.Constantes().kPrefs.setValue(self.passwordTF.text, forKey: Utils.Constantes().kPassword)
            Utils.Constantes().kPrefs.setValue(self.usuarioLogueado, forKey: Utils.Constantes().kUsuarioLogueado)
            self.configuracionUI(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
            self.loginBTN.setTitle("Log In", for: .normal)
        }else{
            self.present(Utils.muestraAlerta(titulo: "Alerta!",
                                             mensaje: "Rellena el usuario y el password",
                                             completionHandler: nil),
            animated: true,
            completion: nil)
        }

    }
    @IBAction func loginACTION(_ sender: Any) {
        if datosCompletados(){
            self.borrarDatosFormulario()
        }else{
            self.present(Utils.muestraAlerta(titulo: "Alerta!", mensaje: "Rellena el usuario y el password", completionHandler: nil),animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI(color:#colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1))
        // Do any additional setup after loading the view.
    }


    private func configuracionUI(color: UIColor){
        self.contentViewUserName.backgroundColor = .clear
        self.contentViewUserName.layer.cornerRadius = 37
        self.contentViewUserName.layer.borderWidth = 2
        self.contentViewUserName.layer.borderColor = color.cgColor

        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = color.cgColor
        
        self.loginBTN.layer.cornerRadius = 23
        self.loginBTN.setTitle("", for: .normal)
    }
    
    private func datosCompletados() -> Bool {
        return !(self.userNameTF.text?.isEmpty ?? false) && !(self.passwordTF.text?.isEmpty ?? false)
    }
    
    private func borrarDatosFormulario(){
        self.userNameTF.text = ""
        self.passwordTF.text = ""
        self.mostrarHomeTabBar()
    }
    
    private func mostrarHomeTabBar(){
        let vc = HomeTabBarCoordinator.homeViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}


