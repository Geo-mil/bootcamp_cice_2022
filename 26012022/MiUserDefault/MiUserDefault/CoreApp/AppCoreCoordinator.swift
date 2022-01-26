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
        self.actualVC = RegistroCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
}

