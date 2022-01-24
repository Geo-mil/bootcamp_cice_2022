//
//  ListaSuperCochesCoordinator.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 24/01/2022.
//

import UIKit

final class ListaSuperCochesCoordinator {
    static func navigation()-> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController{
        let vc = ListaSuperCochesViewController()
        return vc
    }
}
