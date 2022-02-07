//
//  SplashInteractor.swift
//  CiceMusic
//
//  Created by cice on 04/02/2022.
//

import Foundation

protocol SplashInteractorInputProtocol {
    func fetchDataFormWebServiceInteractor()
}

final class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol>{
    
}

extension SplashInteractor: SplashInteractorInputProtocol{
    func fetchDataFormWebServiceInteractor() {
        //
    }
}
