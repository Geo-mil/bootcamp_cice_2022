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

//Input del presenter
protocol MusicPresenterInputProtocol {
    func loadDataFromInteractor()
    func nubmerOfRows() -> Int?
    func informationForCell(indexPath: Int) -> GenericResult?
    func didSelectRow(data: GenericResult)
}
//Output del interactor
protocol MusicInteractorOutputProtocol {
    func dataTransformedFromInteractor(data: [GenericResult]?)
    
}

final class MusicPresenter: BasePresenter<MusicPresenterOutputProtocol , MusicInteractorInputProtocol, MusicRouterInputProtocol> {
    //MARK: - Variables globales
    var dataSourceViewModel: [GenericResult] = []
    
}

//Input del presenter
extension MusicPresenter: MusicPresenterInputProtocol {
    func nubmerOfRows() -> Int? {
        return self.dataSourceViewModel.count
    }
    
    func  loadDataFromInteractor() {
        self.interactor?.transformDataFromInteractor()
    }
    
    func informationForCell(indexPath: Int) -> GenericResult?{
        return self.dataSourceViewModel[indexPath]
    }
    
    func didSelectRow(data: GenericResult) {
        self.router?.didSelectRowRouter(data: data)
    }
}

//Output del interactor
extension MusicPresenter: MusicInteractorOutputProtocol {
    func dataTransformedFromInteractor(data: [GenericResult]?){
        self.dataSourceViewModel.removeAll()
        guard let dataSourceUnw = data else {return}
        self.dataSourceViewModel = dataSourceUnw
        self.viewController?.reloadInformationInView()
    }
}


