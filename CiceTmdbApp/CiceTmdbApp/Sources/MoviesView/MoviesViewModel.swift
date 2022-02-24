//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import Foundation

//Output del interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol{
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?)
    func setInfoPopularViewModel(data: [MoviesTVModelView]?)
    func setInfoTopRatedViewModel(data: [MoviesTVModelView]?)
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - Dependences Inyection (DI)
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    //MARK: - Variables
    @Published var dataSourceNowPlaying: [MoviesTVModelView] = []
    @Published var dataSourcePopular: [MoviesTVModelView] = []
    @Published var dataSourceTopRated: [MoviesTVModelView] = []
    @Published var dataSourceUpcoming: [MoviesTVModelView] = []
    
    //MARK: - Metodos publicos para la View
    func fetchData(){
        self.interactor?.fetchDataNowPlayingInteractor()
        self.interactor?.fetchDataPopularInteractor()
        self.interactor?.fetchDataTopRatedInteractor()
        self.interactor?.fetchDataUpcomingInteractor()
    }
    
}

//Output del interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?){
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
    
    func setInfoPopularViewModel(data: [MoviesTVModelView]?) {
        self.dataSourcePopular.removeAll()
        self.dataSourcePopular = data ?? []
    }
    
    func setInfoTopRatedViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceTopRated.removeAll()
        self.dataSourceTopRated = data ?? []
    }
    
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceUpcoming.removeAll()
        self.dataSourceUpcoming = data ?? []
    }
    
    
}
