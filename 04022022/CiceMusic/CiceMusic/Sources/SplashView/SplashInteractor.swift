//
//  SplashInteractor.swift
//  CiceMusic
//
//  Created by cice on 04/02/2022.
//

import Foundation

//input del interactor
protocol SplashInteractorInputProtocol {
    func fetchDataFormWebServiceInteractor()
}

final class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol>{
    
    let splashProvider: SplashProviderInputProtocol = SplashProvider()
    
   
}

//Input del interactor
extension SplashInteractor: SplashInteractorInputProtocol{
    func fetchDataFormWebServiceInteractor() {
        self.splashProvider.fetchData { [weak self] (result) in
            guard self != nil else {return}
            switch result {
            case let .success(model):
                self?.presenter?.setDataFromWebInteractor(data: model.menuResponse)
            case let .failure(error):
                self?.presenter?.setAlertMessage(error: error)
                debugPrint(error)
            }
            
        }
    }
}
