//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by cice on 04/02/2022.
//

import Foundation

protocol SplashRouterInputProtocol {
    func fetchDataFormWebServiceInteractor()
}

final class SplashRouter: BaseRouter<SplashViewController>{
    
}

extension SplashRouter: SplashRouterInputProtocol{
    func fetchDataFormWebServiceInteractor() {
        
    }
    
}

