//
//  AppDelegate.swift
//  CiceMusic
//
//  Created by cice on 04/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Variables Globales
    var window: UIWindow?
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()
    var canRotate = false
    var orientationEnable: UIInterfaceOrientationMask = .portrait

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window{
            self.appCore.initialViewController(window: windowUnw)
        }
        
        return true
    }

  // MARK: - Autorotations
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if canRotate {
            return .all
        }else{
            return orientationEnable
        }
    }


}

