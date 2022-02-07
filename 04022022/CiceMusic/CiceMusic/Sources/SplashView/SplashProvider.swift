//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by cice on 04/02/2022.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData()
    
}

final class SplashProvider: SplashProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService
    
    func fetchData() {
        self.networkService.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "10"))
    }
}

struct SplashRequestDTO {
    static fucn requestData(numeroItems: String)-> RequestDTO{
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(arrayParams: nil, method: .get, endpoint: urlComplete)
        return request
    }
}
