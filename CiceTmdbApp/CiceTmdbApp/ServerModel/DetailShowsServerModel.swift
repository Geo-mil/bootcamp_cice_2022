//
//  DetailShowsServerModel.swift
//  CiceTmdbApp
//
//  Created by Jorge Millan on 1/3/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailShowServerModel = try? newJSONDecoder().decode(DetailShowServerModel.self, from: jsonData)

import Foundation

// MARK: - DetailShowServerModel
struct DetailShowServerModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let createdBy: [ShowCreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [ShowGenre]?
    let homepage: String?
    let id: Int?
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: LastEpisodeToAir?
    let name: String?
    //let nextEpisodeToAir: JSONNull?
    let networks: [Network]?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ShowProductionCompany]?
    let productionCountries: [ShowProductionCountry]?
    let seasons: [Season]?
    let spokenLanguages: [ShowSpokenLanguage]?
    let status: String?
    let tagline: String?
    let type: String?
    let voteAverage: Double?
    let voteCount: Int?
    let similar: Similar?
    let videos: Videos?
    let credits: ShowCredits?
    

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case inProduction = "in_production"
        case languages = "languages"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name = "name"
        //case nextEpisodeToAir = "next_episode_to_air"
        case networks = "networks"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons = "seasons"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case type = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case similar = "similar"
        case videos = "videos"
        case credits = "credits"
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var genreText: String{
        genres?.first?.name ?? "n/a"
    }
    
    var yearText: String{
        guard let releaseDateUnw = self.firstAirDate, let dateUnw =  Utils.dateFormatter.date(from: releaseDateUnw) else {
            return "n/a"
        }
        return Utils.yearFormatter.string(from: dateUnw)
    }
    
    var minDurationText: String{
        guard let runtimeUnw = episodeRunTime?.min(), runtimeUnw > 0 else {
            return "n/a"
        }
        return Utils.durationFormatter.string(from: TimeInterval(runtimeUnw) * 60) ?? "n/a"
    }
    
    var maxDurationText: String{
        guard let runtimeUnw = episodeRunTime?.max(), runtimeUnw > 0 else {
            return "n/a"
        }
        return Utils.durationFormatter.string(from: TimeInterval(runtimeUnw) * 60) ?? "n/a"
    }
    
    var seasonsNumberText: String{
        guard let seasonsNumUnw = self.seasons?.count , seasonsNumUnw > 0 else {
            return "n/a"
        }
        return  "\(seasonsNumUnw)"
    }
    
    var ratingText: String{
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (partialResult, _) -> String in
            return partialResult + "★"
        }
        return ratingText
    }
    
    var scoreText: String{
        guard ratingText.count > 0 else {
            return "N/A"
        }
        return "\(ratingText.count) / 10"
    }
    
//    var cast: [Cast]? {
//        credits?.cast
//    }
//
//    var crew: [ShowCrew]? {
//        credits?.crew
//    }
//
//    var directors: [Crew]? {
//        crew?.filter { $0.job?.lowercased() == "director" }
//    }
//
//    var producers: [Crew]? {
//        crew?.filter { $0.job?.lowercased() == "producer" }
//    }
//
//    var screenWritters: [Crew]? {
//        crew?.filter { $0.job?.lowercased() == "writer" }
//    }
    
    var youtubeTrailers: [ResultDetailMovie]? {
        videos?.results?.filter { $0.youtubeURL != nil}
    }
    
}

// MARK: - CreatedBy
struct ShowCreatedBy: Codable {
    let id: Int?
    let creditID: String?
    let name: String?
    let gender: Int?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case creditID = "credit_id"
        case name = "name"
        case gender = "gender"
        case profilePath = "profile_path"
    }
}

// MARK: - Credits
struct ShowCredits: Codable {
    let cast: [ShowCast]?
    let crew: [Crew]?

    enum CodingKeys: String, CodingKey {
        case cast = "cast"
        case crew = "crew"
    }
}

// MARK: - Cast
struct ShowCast: Codable, Identifiable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let character: String?
    let creditID: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case character = "character"
        case creditID = "credit_id"
        case order = "order"
    }
}

// MARK: - Crew
struct ShowCrew: Codable, Identifiable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let creditID: String?
    let department: String?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case originalName = "original_name"
        case popularity = "popularity"
        case profilePath = "profile_path"
        case creditID = "credit_id"
        case department = "department"
        case job = "job"
    }
}

// MARK: - Genre
struct ShowGenre: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

// MARK: - LastEpisodeToAir
struct LastEpisodeToAir: Codable {
    let airDate: String?
    let episodeNumber: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let productionCode: String?
    let seasonNumber: Int?
    let stillPath: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case productionCode = "production_code"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Network
struct Network: Codable {
    let name: String?
    let id: Int?
    let logoPath: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCompany
struct ShowProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ShowProductionCountry: Codable {
    let iso3166_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name = "name"
    }
}

// MARK: - Season
struct Season: Codable {
    let airDate: String?
    let episodeCount: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let seasonNumber: Int?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id = "id"
        case name = "name"
        case overview = "overview"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}

// MARK: - Similar
struct Similar: Codable {
    let page: Int?
    let results: [ShowsResult]?
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
struct ShowsResult: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let firstAirDate: String?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - SpokenLanguage
struct ShowSpokenLanguage: Codable {
    let englishName: String?
    let iso639_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name = "name"
    }
}

// MARK: - Videos
struct ShowVideos: Codable {
    let results: [VideosResult]?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - VideosResult
struct VideosResult: Codable {
    let iso639_1: String?
    let iso3166_1: String?
    let name: String?
    let key: String?
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt: String?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name = "name"
        case key = "key"
        case site = "site"
        case size = "size"
        case type = "type"
        case official = "official"
        case publishedAt = "published_at"
        case id = "id"
    }
}

extension DetailShowServerModel {
    static var stubbedDetailShow: DetailShowServerModel? {
        let response: DetailShowServerModel? = try? Bundle.main.loadAndDecodeJson(filename: "DetailShow")
        if let responseUnw = response{
            return responseUnw
        }
        return nil
    }
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
