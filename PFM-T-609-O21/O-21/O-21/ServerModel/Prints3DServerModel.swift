//
//  Prints3DServerModel.swift
//  O-21
//
//  Created by Jorge Millan
//

import Foundation

// MARK: - Prints3DServerModel
struct Prints3DServerModel: Codable {
    let page: Int?
    let results: [ResultPrints3D]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultPrints3D: Codable {
    let name: String?
    let imagePath: String?
    let id: Int?
    let categories: [String]?
    let releaseDate: String?
    let price: String?
    let comments: String?
    let otherImagesPaths: [String]?
    let videosPath: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imagePath = "imagePath"
        case id = "id"
        case categories = "categories"
        case releaseDate = "releaseDate"
        case price = "price"
        case comments = "comments"
        case otherImagesPaths = "otherImagesPaths"
        case videosPath = "videosPath"
    }
}


extension Prints3DServerModel {
    
    static var stubbedPrints3D: Prints3DServerModel? {
        let response: Prints3DServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "impresiones")
        if let responseUnw = response {
            return responseUnw
        }
        return nil
    }
    
}
