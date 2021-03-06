/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation

// Output del Interactor
protocol DetailMovieInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationDetail(data: DetailMovieServerModel?)
    func setInformationSavedCorrectly()
}

final class DetailMovieViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - Dependences Inyection (DI)
    var interactor: DetailMovieInteractorInputProtocol?{
        super.baseInteractor as? DetailMovieInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var data: DetailMovieServerModel?
    @Published var isSaved = false
    
    //MARK: - Metodos publicos para la View
    func fetchData(){
        self.interactor?.fetchDataDetailMovieInteractor()
    }
    
    func saveDataAsFavourites(){
        self.interactor?.saveDataAsFavouritesInteractor()
        self.isSaved = true
    }
}

// Output del Interactor
extension DetailMovieViewModel: DetailMovieInteractorOutputProtocol {
    func setInformationDetail(data: DetailMovieServerModel?) {
        guard let dataUnw = data else{
            return
        }
        self.data = dataUnw
        DDBB.shared.getAllLocal { result in
            result?.downloads.map{ item in
                item.map{ itemX in
                    if "\(dataUnw.id ?? 0)" == itemX.id{
                        self.isSaved = true
                    }
                }
            }
        } failure: { error in
            debugPrint(error)
        }

    }
    
    func setInformationSavedCorrectly(){
        
    }
}


