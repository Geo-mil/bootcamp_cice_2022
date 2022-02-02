//
//  NuevaTareaViewController.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

class NuevaTareaViewController: UIViewController {

    //MARK: - Variables globales
    let dataSourcePrioridad = ["ALTA", "MEDIA-ALTA", "MEDIA", "MEDIA-BAJA", "BAJA"]
    var nombreCategoria = "Sin Categoria"
    var fotoSeleccionada = false
    
    //MARK: - IBOutlets
    @IBOutlet weak var nuevaTareaTF: UITextField!
    @IBOutlet weak var prioridadTF: UITextField!
    @IBOutlet weak var fechaTF: UITextField!
    @IBOutlet weak var categoriaLBL: UILabel!
    @IBOutlet weak var descripcionTV: UITextView!
    @IBOutlet weak var imagenTareaIV: UIImageView!
    @IBOutlet weak var categoriaBTN: UIButton!
    @IBOutlet weak var salvarDatosBTN: UIButton!
    
    //MARK: - IBActions
    
    @IBAction func muestraListaCategorias(_ sender: Any) {
    }
    
    @IBAction func salvarTareaUDACTION(_ sender: Any) {
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        self.muestraSelectorFoto()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionImageViewEnable()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionImageViewEnable(){
        self.imagenTareaIV.isUserInteractionEnabled = true
        let tapGR = UIGestureRecognizer(target: self, action: #selector(muestraSelectorFoto))
        self.imagenTareaIV.addGestureRecognizer(tapGR)
    }

    @objc
    func muestraSelectorFoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.muestraPhotoMenu()
        }else{
            self.muestraPhotoLibrary()
        }
    }
    
    private func configuracionUI() {
        self.title = "Nueva tarea"
        self.categoriaBTN.layer.cornerRadius = 16
        self.salvarDatosBTN.layer.cornerRadius = 16
        self.imagenTareaIV.layer.cornerRadius = self.imagenTareaIV.frame.width / 2
        self.imagenTareaIV.layer.borderWidth = 1.2
        self.imagenTareaIV.layer.borderColor = UIColor.red.cgColor
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.prioridadTF.inputView = pickerView
        self.prioridadTF.text = self.dataSourcePrioridad.first
        
        self.categoriaLBL.text = self.nombreCategoria
    }
    
    private func muestraPhotoMenu(){
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler:{_ in self.tomafoto()}))
        actionSheetVC.addAction(UIAlertAction(title: "Escoge de la libreria", style: .default, handler:{_ in self.muestraPhotoLibrary()}))
        self.present(actionSheetVC, animated: true, completion: nil)
        
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

extension NuevaTareaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        if let imageUnw = info[.originalImage] as? UIImage{
            self.imagenTareaIV.image = imageUnw
            self.fotoSeleccionada = true
            
        }
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension NuevaTareaViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataSourcePrioridad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataSourcePrioridad[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return self.prioridadTF.text = self.dataSourcePrioridad[row]
    }
    
}
