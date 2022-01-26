//
//  RegistroViewCoordinator.swift
//  MiUserDefault
//
//  Created by cice on 26/01/2022.
//

import UIKit

final class RegistroCoordinator{
    
    //Wildcard - comodin
    static func navigation() -> UINavigationController{
        let navVC = UINavigationController (rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = RegistroViewController()
        return vc
    }
}
