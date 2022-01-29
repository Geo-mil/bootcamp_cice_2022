//
//  AppCoreCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by cice on 28/01/2022.
//

import UIKit

protocol AppCoreCoordinatorProtocol{
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator{
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol{
    func initialViewController(window: UIWindow){
        if Utils.Constantes().kPrefs.bool(forKey: Utils.Constantes().kUsuarioLogueado){
            self.actualVC = HomeTabBarCoordinator.homeViewController()
        }else{
            self.actualVC = LoginViewCoordinator.view()
        }
        self.actualVC = LoginViewCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
}
