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
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

// Input Protocol
protocol Prints3DProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataPrints3DProvider()
}

final class Prints3DProvider: BaseProvider {
    
    //MARK: - Inyeccion de dependencia
    weak var interactor: Prints3DProviderOutputProtocol? {
        super.baseInteractor as? Prints3DProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension Prints3DProvider: Prints3DProviderInputProtocol{

    //Este metodo muestra la forma de subscripcion del metodo al AnyPublisher
    
    func fetchDataPrints3DProvider() {
        let db = Firestore.firestore()
        var dataUnw : [ResultPrints3D] = []
        db.collection("impresiones").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                self.interactor?.setInformationPrints3D(completion: .failure(err as! NetworkError))
            } else {
                
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let dataDescription = document.data()
                    
                    let object = ResultPrints3D(name: (dataDescription["name"] ?? "") as? String,
                                                imagePath: (dataDescription["imagePath"] ?? "") as? String,
                                                id: Int(document.documentID) ?? 0,
                                                categories: (dataDescription["categories"] ?? "") as? [String],
                                                releaseDate: (dataDescription["releaseDate"] ?? "") as? String,
                                                price: (dataDescription["price"] ?? "") as? String,
                                                comments: (dataDescription["comments"] ?? "") as? String,
                                                otherImagesPaths: (dataDescription["otherImagesPaths"] ?? "") as? [String],
                                                videosPath: (dataDescription["videosPath"] ?? "") as? [String])
                    
                    dataUnw.append(object)
                    
                }
                self.interactor?.setInformationPrints3D(completion: .success(dataUnw))
            }
        }
    }
    
}

//struct Prints3DRequestDTO {
//
//    static func requestData(numeroItems: String) -> RequestDTO {
//        let argument: [CVarArg] = [numeroItems]
//        let urlComplete = String(format: URLEndpoint.music, arguments: argument)
//        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
//        return request
//    }
//}
