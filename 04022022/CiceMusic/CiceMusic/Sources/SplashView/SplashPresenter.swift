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
    func setDataFromWebInteractor(data: [MenuResponse]?)
    func setAlertMessage(error: NetworkError)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol , SplashInteractorInputProtocol, SplashRouterInputProtocol>{
    
    var dataSourceViewModel: [MenuResponse] = []
}
//Input del presenter
extension SplashPresenter: SplashPresenterInputProtocol{
    func fetchDataFromWebService(){
        self.interactor?.fetchDataFormWebServiceInteractor()
    }
    
    func showHometabBar() {
        if Utils.Constantes().kPrefer.bool(forKey: Utils.Constantes().kUsuarioLogueado) {
            self.router?.showHometabBarRouter(dataSource: self.dataSourceViewModel)
        } else {
            self.router?.showLoginViewRouter(dataSource: self.dataSourceViewModel)
        }
    }
}
//Output del interactor
extension SplashPresenter: SplashInteractorOutputProtocol{
    func setDataFromWebInteractor(data: [MenuResponse]?){
        guard let dataUnw = data else {return}
        self.dataSourceViewModel.removeAll()
        self.dataSourceViewModel = dataUnw
        self.viewController?.launchAnimation()
        
    }
    
    func setAlertMessage(error: NetworkError){
        self.router?.showAlert(title: "\(error.status)", message: error.status.rawValue == -1011 ? error.description :"Todo bien")
    }
}
