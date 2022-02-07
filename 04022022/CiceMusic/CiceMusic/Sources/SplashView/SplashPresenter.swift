//
//  SplashPresenter.swift
//  CiceMusic
//
//  Created by cice on 04/02/2022.
//

import Foundation

protocol SplashPresenterInputProtocol {
    func fetchDataFromWebService()
}

protocol SplashInteractorOutputProtocol {
    
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol , SplashInteractorInputProtocol, SplashRouterInputProtocol>{
    
}

extension SplashPresenter: SplashPresenterInputProtocol{
    func fetchDataFromWebService(){
        self.interactor?.fetchDataFormWebServiceInteractor()
    }
}

extension SplashPresenter: SplashInteractorOutputProtocol{
    
}
