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

extension SplashInteractor: SplashInteractorInputProtocol{
    func fetchDataFormWebServiceInteractor() {
       print("Aqui Jorge")
        self.splashProvider.fetchData { (result) in
            switch result{
            case .success(let modelData):
                self.presenter?.setDataFromWebInteractor(data: modelData.feed?.results)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
