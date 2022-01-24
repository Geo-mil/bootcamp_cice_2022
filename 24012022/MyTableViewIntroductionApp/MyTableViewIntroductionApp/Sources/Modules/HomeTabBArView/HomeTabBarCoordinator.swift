//
//  HomeTabBarCoordinator.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 24/01/2022.
//

import UIKit

final class HomeTabBarCoordinator{
    static func tabBarController() -> UITabBarController {
        let tabVC = HomeTabBarViewController()
        
        //Controladores
        let listaMeses = ListaCochesCoordinator.navigation()
        let listaCoches = ListaSuperCochesCoordinator.navigation()
        
        //iconos
        let listaMesesIcon =  UITabBarItem(title: "Meses", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let listaCochesIcon = UITabBarItem(title: "Coches", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        //asignar el icono al controlador
        listaMeses.tabBarItem = listaMesesIcon
        listaCoches.tabBarItem = listaCochesIcon
        
        //asignamos el array de controladores y su orden
        tabVC.viewControllers = [listaMeses, listaCoches]
        return tabVC
    }
}
