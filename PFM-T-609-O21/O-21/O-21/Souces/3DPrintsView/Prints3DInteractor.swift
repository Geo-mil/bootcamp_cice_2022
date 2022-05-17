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

// Input del Interactor
protocol Prints3DInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataPrints3DInteractor()
}

//output del provider
protocol Prints3DProviderOutputProtocol: BaseProviderOutputProtocol{
    func setInformationPrints3D(completion: Result<[ResultPrints3D]?, NetworkError>)
}

final class Prints3DInteractor: BaseInteractor {
    
    //MARK: Inyeccion de dependencias
    weak var viewModel: Prints3DInteractorOutputProtocol? {
        super.baseViewModel as? Prints3DInteractorOutputProtocol
    }
    
    var provider: Prints3DProviderInputProtocol? {
        super.baseProvider as? Prints3DProviderInputProtocol
    }
    
    func transformDataResultPrints3DToImpresionesModelView(data: [ResultPrints3D]?) -> [ImpresionesModelView]? {
        var dataSource3DPrints: [ImpresionesModelView] = []
        if let dataUnw = data{
            for index in 0..<dataUnw.count{
                let object = ImpresionesModelView(id: dataUnw[index].id,
                                                  name: dataUnw[index].name,
                                                  imagePath: dataUnw[index].imagePath,
                                                  coments: dataUnw[index].comments,
                                                  categories: dataUnw[index].categories,
                                                  price: dataUnw[index].price)
                dataSource3DPrints.append(object)
            }
        }
        return dataSource3DPrints
    }
}

// Input del Interactor
extension Prints3DInteractor: Prints3DInteractorInputProtocol {
    func fetchDataPrints3DInteractor(){
        self.provider?.fetchDataPrints3DProvider()
    }
}

//output del provider
extension Prints3DInteractor: Prints3DProviderOutputProtocol{
    func setInformationPrints3D(completion: Result<[ResultPrints3D]?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInformationPrints3D(data: self.transformDataResultPrints3DToImpresionesModelView(data: data))
        case.failure(let error):
            debugPrint(error)
        }
    }
}
