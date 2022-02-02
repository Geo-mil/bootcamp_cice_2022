//
//  DetalleContactoViewController.swift
//  MiTaskVersion3.0
//
//  Created by cice on 31/01/2022.
//

import UIKit
import MessageUI

class DetalleContactoViewController: UIViewController {
    
    //MARK: Variables globales
    var dataModel: ArrayContact?
    
    //MARK: - IBOutlets
    @IBOutlet weak var detalleContactoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionTableView()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI(){
        let button1 = UIBarButtonItem(image: UIImage(systemName: "mail"), style: .plain, target: self, action: #selector(configuracionMail))
        self.navigationItem.rightBarButtonItem = button1
    }

    private func configuracionTableView(){
        self.detalleContactoTableView.delegate = self
        self.detalleContactoTableView.dataSource = self
        self.detalleContactoTableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
    }
    
    @objc
    func configuracionMail(){
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.configuracionMailCompose(delegate: self, data: dataModel),
                         animated: true,
                         completion: nil)
        }else{
            self.present(Utils.muestraAlerta(titulo: "Ups", mensaje: "No puedes mandar mails", completionHandler: nil),
            animated: true,
            completion: nil)
        }
    }
    
    private func muestraPhotoMenu(){
            let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    }
            
    private func muestraPhotoLibrary(){
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
    }
            
    private func tomafoto() {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
    }

}

extension DetalleContactoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.detalleContactoTableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
        cell.delegate = self
        if let modelData = self.dataModel{
            cell.configuracionCell(data: modelData)
        }
        return cell
    }

}

extension DetalleContactoViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetalleContactoViewController: MFMailComposeViewControllerDelegate{
            
}

extension DetalleContactoViewController: PerfilCellDelegate{
    func showCameraPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.muestraPhotoMenu()
        }else{
            self.muestraPhotoLibrary()
        }
    }
}

extension DetalleContactoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        if let image = info[.originalImage] as? UIImage{
            debugPrint(image)
            let imageData = image.jpegData(compressionQuality: 0.5)
            Utils.Constantes().kPrefs.setValue(imageData, forKey: Utils.Constantes().kImageProfile)
            self.detalleContactoTableView.reloadData()
        }
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
