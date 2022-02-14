//
//  ListaPerfilPostViewController.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 25/01/2022.
//

import UIKit

class ListaPerfilPostViewController: UIViewController {

    @IBOutlet weak var miPerfilposttableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTableView()

        // Do any additional setup after loading the view.
    }


    private func configuracionTableView(){
        self.miPerfilposttableView.delegate = self
        self.miPerfilposttableView.dataSource = self
        self.miPerfilposttableView.register(UINib(nibName: PerfilCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: PerfilCell.defaultReuseIdentifier)
        self.miPerfilposttableView.register(UINib(nibName: PostCell.defaultReuseIdentifier , bundle: nil), forCellReuseIdentifier: PostCell.defaultReuseIdentifier)
    }
    
}

extension ListaPerfilPostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellPerfil = self.miPerfilposttableView.dequeueReusableCell(withIdentifier: PerfilCell.defaultReuseIdentifier, for: indexPath) as! PerfilCell
            cellPerfil.delegate = self
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Jorge", descripcionPerfil: "Basico", puestoActualperfil: "uno cualquiera", usuarioLinkedInPerfil: "JM", imagePerfil: "thor"))
            return cellPerfil
        default:
            let cellPost = self.miPerfilposttableView.dequeueReusableCell(withIdentifier: PostCell.defaultReuseIdentifier, for: indexPath) as! PostCell
            cellPost.setupPostCell(data: UserDataModel(nombrePerfil: "Miranda", descripcionPerfil: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", puestoActualperfil: "cualquiera", usuarioLinkedInPerfil: "MLambert", imagePerfil: "Miranda_Lambert"))
            return cellPost
        }
    }
}

extension ListaPerfilPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 265
        default:
            return UITableView.automaticDimension
        }
    }
}

extension ListaPerfilPostViewController: PerfilCellDelegate{
    func showAlertB1() {
        let alertVC = UIAlertController(title: "Explota la cabeza", message: "\(#function)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    func showAlertB2(){
        let alertVC = UIAlertController(title: "Explota la cabeza", message: "a por ellos oe", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    func navigationToDetailView(withData: UserDataModel?) {
        let alertVC = UIAlertController(title: "Explota la cabeza", message: withData?.nombrePerfil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

