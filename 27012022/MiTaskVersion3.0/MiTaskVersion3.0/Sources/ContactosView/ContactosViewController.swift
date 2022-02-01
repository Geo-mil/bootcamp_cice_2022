//
//  ContactosViewController.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

class ContactosViewController: UIViewController{

    // MARK: - Variables globales
    
    var dataSourceContactos: [ArrayContact]=[]
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataSourceContactos()

        // Do any additional setup after loading the view.
    }
    
    private func setDataSourceContactos(){
        self.dataSourceContactos = ContactosServerModel.stubbedContactos ?? []
        self.configuracionTableView()
    }
     
    private func configuracionTableView(){
        self.contactsTableView.delegate = self
        self.contactsTableView.dataSource = self
        //Registrar la celda
        self.contactsTableView.register(UINib(nibName: ContactosCellTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: ContactosCellTableViewCell.defaultReuseIdentifier)
    }

    
}

extension ContactosViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataSourceContactos[indexPath.row]
        let vc = DetalleViewCoordinator.view(dto: DetalleContactoCoordinatorDTO(model: model))
        self.show(vc, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ContactosViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.contactsTableView.dequeueReusableCell(withIdentifier: ContactosCellTableViewCell.defaultReuseIdentifier, for: indexPath) as! ContactosCellTableViewCell
        cell.configuracionCell(data: self.dataSourceContactos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceContactos.count
    }
    
    
    
}
