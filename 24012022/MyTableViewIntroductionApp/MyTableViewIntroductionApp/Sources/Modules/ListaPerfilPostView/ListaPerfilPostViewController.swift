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
            cellPerfil.setupCellPerfil(data: UserDataModel(nombrePerfil: "Jorge", descripcionPerfil: "Basico", puestoActualperfil: "uno cualquiera", usuarioLinkedInPerfil: "JM", imagePerfil: "thor"))
            return cellPerfil
        default:
            return UITableViewCell()
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
            return 44
        }
    }
}
