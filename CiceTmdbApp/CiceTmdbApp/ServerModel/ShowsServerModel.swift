//
//  ShowsServerModel.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 24/2/22.
//

import Foundation

// MARK: - ShowsServerModel
struct ShowsServerModel: Codable {
    let pageShows: Int?
    let resultsShows: [ResultShows]?
    let totalPagesShows: Int?
    let totalResultsShows: Int?

    enum CodingKeys: String, CodingKey {
        case pageShows = "page"
        case resultsShows = "results"
        case totalPagesShows = "total_pages"
        case totalResultsShows = "total_results"
    }
}

// MARK: - Result
struct ResultShows: Codable {
    let backdropPath: String?
    let firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
