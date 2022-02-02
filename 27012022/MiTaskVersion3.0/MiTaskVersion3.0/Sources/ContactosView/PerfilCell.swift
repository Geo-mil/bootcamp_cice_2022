//
//  PerfilCell.swift
//  MiTaskVersion3.0
//
//  Created by cice on 01/02/2022.
//

import UIKit

protocol PerfilCellDelegate: AnyObject {
    func showCameraPhoto()
}

protocol PerfilCellProtocol {
    func configuracionCell (data: ArrayContact)
}

class PerfilCell: UITableViewCell, ReuseIdentifierProtocol, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //MARK: - Variables globales
    var delegate: PerfilCellDelegate?

    //MARK: - IBOutlet
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var usuarioTwitter: UILabel!
    @IBOutlet weak var nombrePerfil: UILabel!
    @IBOutlet weak var apellidoPerfil: UILabel!
    @IBOutlet weak var cvPerfil: UILabel!
    @IBOutlet weak var camaraPerfil: UIButton!
    
    //MARK: - IBAction
    @IBAction func camaraAction(_ sender: UIButton) {
        self.delegate?.showCameraPhoto()
    }
    
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField,
                                 dataArray: [String]) {
        
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        textField.inputView = pickerView
        textField.text = dataArray[0]
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

extension PerfilCell: PerfilCellProtocol{
    func configuracionCell(data: ArrayContact) {
        if let imageData = Utils.Constantes().kPrefs.object(forKey: Utils.Constantes().kImageProfile) as? Data{
            self.photoProfile.image = UIImage(data: imageData)
        }else{
            self.photoProfile.image = UIImage(named: data.imageProfile ?? "placeholder")
        }
        
        self.usuarioTwitter.text = data.usernameTwitter
        self.apellidoPerfil.text = data.lastName
        self.cvPerfil.text = data.descriptionCV
    }
}
