//
//  MoviesProvider.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import Foundation
import Combine

protocol MoviesProviderInputProtocol: BaseProviderInputProtocol{
    func fetchDataNowPlayingProvider()
    func fetchDataPopularProvider()
    func fetchDataTopRatedProvider()
    func fetchDataUpcomingProvider()
}

final class MoviesProvider: BaseProvider {
    
    weak var interactor: MoviesProviderOutputProtocol? {
        super.baseInteractor as? MoviesProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

extension MoviesProvider: MoviesProviderInputProtocol{
    
    func fetchDataNowPlayingProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointMoviesNowPlaying,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished now playing")
                case let .failure(error):
                    self?.interactor?.setInformationNowPlaying(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationNowPlaying(completion: .success(resultData.results))
            }
            .store(in: &cancellable)

    }
    
    func fetchDataPopularProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointMoviesPopular,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished popular")
                case let .failure(error):
                    self?.interactor?.setInformationPopular(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationPopular(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataTopRatedProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointMoviesTopRated,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished top rated")
                case let .failure(error):
                    self?.interactor?.setInformationTopRated(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationTopRated(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataUpcomingProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointMoviesUpcoming,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else {return}
                switch completion{
                case .finished:
                    debugPrint("finished upcoming")
                case let .failure(error):
                    self?.interactor?.setInformationUpcoming(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else {return}
                self?.interactor?.setInformationUpcoming(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
}
