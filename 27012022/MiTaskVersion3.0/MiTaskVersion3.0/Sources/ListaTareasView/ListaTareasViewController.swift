//
//  ListaTareasViewController.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

class ListaTareasViewController: UIViewController {
    
    var datasourceTareas: [DownloadNewModel] = []
    
    @IBOutlet weak var listaTareasTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configuracionTV()
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SaveFavoritesPresenter.shared.getAllLocal{
            results in
            if let resultsUnw = results{
                self.datasourceTareas = resultsUnw.downloads ?? []
                self.listaTareasTableView.reloadData()
            }
        }failure: { error in
            debugPrint(error?.debugDescription)
        }
    }

    private func configuracionTV(){
        self.listaTareasTableView.delegate = self
        self.listaTareasTableView.dataSource = self
        self.listaTareasTableView.register(UINib(nibName: CategoriaCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CategoriaCell.defaultReuseIdentifier)
    }
}

extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasourceTareas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listaTareasTableView.dequeueReusableCell(withIdentifier: CategoriaCell.defaultReuseIdentifier, for: indexPath) as! CategoriaCell
        cell.nombreCategoriaLBL.text = self.datasourceTareas[indexPath.row].newTask
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
