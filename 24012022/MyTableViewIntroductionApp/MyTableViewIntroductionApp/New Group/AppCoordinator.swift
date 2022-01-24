//
//  AppCoordinator.swift
//  MyTableViewIntroductionApp
//
//  Created by cice on 24/01/2022.
//

import UIKit
protocol AppCoordinatorProtocol {
    func setPrincipalViewController(window: UIWindow)
}

final class AppCoordinator {
    
    var actualViewController: UIViewController?
    
}

extension AppCoordinator: AppCoordinatorProtocol{
    func setPrincipalViewController(window: UIWindow) {
        self.actualViewController = HomeTabBarCoordinator.tabBarController()
        window.rootViewController = self.actualViewController
        window.makeKeyAndVisible()
    }
    
    
}
