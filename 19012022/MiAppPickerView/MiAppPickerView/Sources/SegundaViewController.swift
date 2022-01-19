//
//  SegundaViewController.swift
//  MiAppPickerView
//
//  Created by cice on 19/01/2022.
//

import UIKit

class SegundaViewController: UIViewController {

    // MARK: Variables
    let dataSourceLocalidades = ["Calamanca", "La Latina", "Parla", "Muencarral"]
    let dataSourceCodigosPostales = ["22001", "22002", "22003", "22004"]
    let dataSourcePrioridadTeletrabajo = ["Altisima", "Moderada", "Baja"]
    let dataSourceFotosPerfil = ["maria", "felipe", "maria", "felipe"]
    
    // MARK: IBOutlets
    @IBOutlet weak var localidadesTF: UITextField!
    @IBOutlet weak var codigoPostalTF: UITextField!
    @IBOutlet weak var prioridadTrabajoTF: UITextField!
    @IBOutlet weak var perfilImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }
    

    private func configuracionUI(){
        
    }
}
