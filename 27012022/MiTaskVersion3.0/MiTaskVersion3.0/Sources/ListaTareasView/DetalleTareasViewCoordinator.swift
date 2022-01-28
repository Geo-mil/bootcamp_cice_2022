//
//  DetalleTareasViewCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

final class DetalleTareasViewCoordinator{
    static func navigation() -> UINavigationController{
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = DetalleTareaViewController()
        return vc
    }
}

