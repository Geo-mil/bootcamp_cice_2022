//
//  SplashPresenter.swift
//  CiceMusic
//
//  Created by cice on 04/02/2022.
//

import Foundation

//Input del presenter
protocol SplashPresenterInputProtocol {
    func fetchDataFromWebService()
    func showHometabBar()
}
//Output del interactor
protocol SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [ResultMusic]?)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol , SplashInteractorInputProtocol, SplashRouterInputProtocol>{
    
    var dataSourceMusic: [ResultMusic] = []
}
//Input del presenter
extension SplashPresenter: SplashPresenterInputProtocol{
    func fetchDataFromWebService(){
        self.interactor?.fetchDataFormWebServiceInteractor()
    }
    
    func showHometabBar() {
        self.router?.showHometabBarRouter(dataSource: self.dataSourceMusic)
    }
}
//Output del interactor
extension SplashPresenter: SplashInteractorOutputProtocol{
    func setDataFromWebInteractor(data: [ResultMusic]?){
        guard let dataUnw = data else {return}
        self.dataSourceMusic.removeAll()
        self.dataSourceMusic = dataUnw
        self.viewController?.launchAnimation()
        
    }
}
