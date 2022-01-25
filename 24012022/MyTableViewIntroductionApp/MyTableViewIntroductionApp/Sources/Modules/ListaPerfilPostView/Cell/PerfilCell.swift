//
//  PerfilCell.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 25/01/2022.
//

import UIKit

protocol PerfilCellProtocol {
    func setupCellPerfil(data: UserDataModel?)
}

class PerfilCell: UITableViewCell, ReuseIdenfierView {
    
    //MARK: - IBOulets
    @IBOutlet weak var miImagenPerfil: UIImageView!
    @IBOutlet weak var miUsuarioLinkedInLBL: UILabel!
    @IBOutlet weak var miNombrePerfilLBL: UILabel!
    @IBOutlet weak var miDescripcionCVLBL: UILabel!
    @IBOutlet weak var miPuestoActualLBL: UILabel!
    
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
        self.miImagenPerfil.image = UIImage(named: data?.imagePerfil ?? "thor")
        self.miUsuarioLinkedInLBL.text = data?.usuarioLinkedInPerfil
        self.miNombrePerfilLBL.text = data?.nombrePerfil
        self.miDescripcionCVLBL.text = data?.descripcionPerfil
        self.miPuestoActualLBL.text = data?.puestoActualperfil
    }
}
