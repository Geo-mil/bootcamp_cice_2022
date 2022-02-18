//
//  GenericWebViewCoordinator.swift
//  CiceMusic
//
//  Created by cice on 16/02/2022.
//

import Foundation

final class GenericWebViewCoordinator{
    
    static func navigation() -> UINavigationController{
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController & GenericWebOutputPresenterProtocol{
        let vc = GenericWebViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: GenericWebViewController) -> GenericWebPresenterInputProtocol{
        let presenter = GenericWebPresenter()
        presenter.viewController = vc
        return presenter
    }
}
