//
//  AppCoreCoordinator.swift
//  MiUserDefault
//
//  Created by cice on 26/01/2022.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC: UIViewController?
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        
        if Utils.Constants().kPrefs.bool(forKey: Utils.Constants().kUserLogeado){
            self.actualVC = HomeViewCoordinator.homeView()
        } else {
            self.actualVC = RegistroCoordinator.view()
        }
        
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    private func muestraRutaUserDefault(){
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
    }
}

