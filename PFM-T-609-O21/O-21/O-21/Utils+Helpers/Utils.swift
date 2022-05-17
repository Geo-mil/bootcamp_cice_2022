//
//  Utils.swift
//  O-21
//
//  Created by Jorge Millan
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case options = "OPTIONS"
}

enum TargetEnvironment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 3
}

struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    var urlContext: URLEndpoint.BaseUrlContext
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String, urlContext: URLEndpoint.BaseUrlContext){
        self.params = params
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String, urlContext: URLEndpoint.BaseUrlContext){
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEndpoint {
    
    #if DEV
    static let environmentDefault: TargetEnvironment = TargetEnvironment.DEV
    #elseif PRE
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRE
    #else
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRO
    #endif
    
    enum BaseUrlContext {
        case backend
        case webService
        case heroku
    }
    
//    //Endpoints of movies
//    static let endpointMoviesNowPlaying = "movie/now_playing?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//    static let endpointMoviesPopular = "movie/popular?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//    static let endpointMoviesTopRated = "movie/top_rated?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//    static let endpointMoviesUpcoming = "movie/upcoming?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//
//    //Endpoints of shows
//    static let endpointShowsAiringToday = "tv/airing_today?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//    static let endpointShowsOnTheAir = "tv/on_the_air?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//    static let endpointShowsPopular = "tv/popular?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//    static let endpointShowsTopRated = "tv/top_rated?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))"
//
//    //Endpoints of detail Movie with parameters
//    static let endpointDetailMovie = "movie/%@?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))&language=\(NSLocale.current.languageCode ?? "ES")&append_to_response=%@"
//    static let endpointDetailShow = "tv/%@?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))&language=\(NSLocale.current.languageCode ?? "ES")&append_to_response=%@"
//
//    // Endpoint of Popular People
//        static let endpointPopularPeople = "person/popular?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))&language=\(NSLocale.current.languageCode ?? "ES")"
//
//    // Buscador de peliculas
//        static let endpointSearchMovie = "search/movie?api_key=\(Obfuscator().reveal(key: Constants.Api.apiKey))&language=\(NSLocale.current.languageCode ?? "ES")&query=%@"
    
}

extension URLEndpoint{
    static func getUrlBase(urlContext: BaseUrlContext) -> String{
        switch urlContext {
        case .backend:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://firebasestorage.googleapis.com/v0/b/r3dapp-a61b3.appspot.com/o/"
            }
        case .webService:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://firestore.googleapis.com/v1"
            }
        case .heroku:
            switch self.environmentDefault{
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        }
    }
}

extension Bundle {
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: ".json") else { return nil }
        let data = try Data(contentsOf: url)
        let decodeModel = try JSONDecoder().decode(D.self, from: data)
        return decodeModel
    }
}

class Utils {
    static let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static let yearFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static let durationFormatter: DateComponentsFormatter = {
       let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
}
