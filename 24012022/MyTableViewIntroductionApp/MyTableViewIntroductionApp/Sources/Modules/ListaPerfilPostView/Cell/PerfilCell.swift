//
//  PerfilCell.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 25/01/2022.
//

import UIKit

protocol PerfilCellDelegate: AnyObject {
    func showAlertB1()
    func showAlertB2()
    func navigationToDetailView(withData: UserDataModel?)
}

protocol PerfilCellProtocol {
    func setupCellPerfil(data: UserDataModel?)
}

class PerfilCell: UITableViewCell, ReuseIdenfierView {
    //MARK - Varaibles globales
    weak var delegate: PerfilCellDelegate?
    var modelData: UserDataModel?
    
    //MARK: - IBOulets
    @IBOutlet weak var miImagenPerfil: UIImageView!
    @IBOutlet weak var miUsuarioLinkedInLBL: UILabel!
    @IBOutlet weak var miNombrePerfilLBL: UILabel!
    @IBOutlet weak var miDescripcionCVLBL: UILabel!
    @IBOutlet weak var miPuestoActualLBL: UILabel!
    
    //MARK: - IBActions
    @IBAction func senderEventAlertB1ACTION(_ sender: Any) {
        self.delegate?.showAlertB1()
    }
    @IBAction func senderEventAlertB2ACTION(_ sender: Any) {
        self.delegate?.showAlertB2()
    }
    @IBAction func senderEventButton3ACTION(_ sender: Any) {
        self.delegate?.navigationToDetailView(withData: self.modelData)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilCell: PerfilCellProtocol {
    func setupCellPerfil(data: UserDataModel?) {
        self.modelData = data
        self.miImagenPerfil.image = UIImage(named: data?.imagePerfil ?? "thor")
        self.miUsuarioLinkedInLBL.text = data?.usuarioLinkedInPerfil
        self.miNombrePerfilLBL.text = data?.nombrePerfil
        self.miDescripcionCVLBL.text = data?.descripcionPerfil
        self.miPuestoActualLBL.text = data?.puestoActualperfil
    }
}
