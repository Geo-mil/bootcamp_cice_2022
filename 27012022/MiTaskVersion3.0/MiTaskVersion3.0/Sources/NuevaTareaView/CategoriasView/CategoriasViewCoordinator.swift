//
//  CategoriasViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

final class CategoriasViewCoordinator{
    static func navigation() -> UINavigationController{
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(delegate: CategoriasViewControllerDelegate? = nil) -> UIViewController {
        let vc = CategoriasViewController()
        vc.delegate = delegate
        return vc
    }
}
