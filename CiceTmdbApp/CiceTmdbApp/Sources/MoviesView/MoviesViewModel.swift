//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 23/2/22.
//

import Foundation

//Output del interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol{
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - Dependences Inyection (DI)
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    //MARK: - Variables
    @Published var dataSourceNowPlaying: [ResultNowPlaying] = []
    
    //MARK: - Metodos publicos para la View
    func fetchData(){
        self.interactor?.fetchDataNowPlayingInteractor()
    }
    
}

//Output del interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?){
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
}
