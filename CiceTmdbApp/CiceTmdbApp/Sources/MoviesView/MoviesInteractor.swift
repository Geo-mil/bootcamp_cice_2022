//
//  MoviesInteractor.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import Foundation

//input del interactor
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataNowPlayingInteractor()
}

//output del provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>)
}

final class MoviesInteractor: BaseInteractor {
    
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
    
}

//input del interactor
extension MoviesInteractor: MoviesInteractorInputProtocol{
    func fetchDataNowPlayingInteractor(){
        self.provider?.fetchDataNowPlayingProvider()
    }
}

//output del provider
extension MoviesInteractor: MoviesProviderOutputProtocol{
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>){
        switch completion{
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
