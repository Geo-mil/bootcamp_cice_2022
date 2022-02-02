//
//  HomeTabBarViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

final class HomeTabBarCoordinator {
    static func homeViewController() -> UITabBarController{
        let homeVC = HomeTabBarViewController()
        
        let contactosVC = contactosViewCoordinator.navigation()
        let nuevatareaVC = NuevaTareaViewCoordinator.navigation()
        let listatareasVC = ListaTareasViewCoordinator.navigation()
        
        let iconContacto = UITabBarItem(title: "Mis Contactos", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        let iconNuevaTarea = UITabBarItem(title: "Nueva Tarea", image: UIImage(systemName: "pencil.and.outline"), selectedImage: UIImage(systemName: "pencil.and.outline"))
        
        let iconListaTarea = UITabBarItem(title: "Mis Tareas", image: UIImage(systemName: "text.redaction"), selectedImage: UIImage(systemName: "text.redaction"))
        
        contactosVC.tabBarItem = iconContacto
        nuevatareaVC.tabBarItem = iconNuevaTarea
        listatareasVC.tabBarItem = iconListaTarea
        
        homeVC.viewControllers = [contactosVC, nuevatareaVC, listatareasVC]
        
        return homeVC
    }
}
