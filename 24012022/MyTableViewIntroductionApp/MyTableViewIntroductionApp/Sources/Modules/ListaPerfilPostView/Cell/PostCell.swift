//
//  PostCell.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 25/01/2022.
//

import UIKit

protocol PostCellProtocol{
    func setupPostCell(data: UserDataModel?)
}
class PostCell: UITableViewCell, ReuseIdenfierView {
    
    // MARK: IBOutlets
    @IBOutlet weak var miImagenPerfilPost: UIImageView!
    
    @IBOutlet weak var miNombrePerfilPost: UILabel!
    @IBOutlet weak var miPuestoDeTrabajoPost: UILabel!
    @IBOutlet weak var miFechaActualPost: UILabel!
    @IBOutlet weak var miDescripcionPost: UILabel!
    @IBOutlet weak var miTituloPostLBL: UILabel!
    @IBOutlet weak var miNumeroLikesLBL: UILabel!
    @IBOutlet weak var miNumeroCometariosLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI(){
        self.miImagenPerfilPost.layer.cornerRadius = self.miImagenPerfilPost.frame.width / 2
    }
    
}

extension PostCell: PostCellProtocol {
    func setupPostCell(data: UserDataModel?) {
        self.miImagenPerfilPost.image = UIImage(named: data?.imagePerfil ?? "thor")
        self.miNombrePerfilPost.text = data?.nombrePerfil
        self.miPuestoDeTrabajoPost.text = data?.puestoActualperfil
        self.miFechaActualPost.text = "\(Date())"
        self.miDescripcionPost.text = data?.descripcionPerfil
        self.miTituloPostLBL.text = "Estamos lanzando la App"
        self.miNumeroLikesLBL.text = "Likes: 1K"
        self.miNumeroCometariosLBL.text = "Comentarios: 2K"
    }
}
