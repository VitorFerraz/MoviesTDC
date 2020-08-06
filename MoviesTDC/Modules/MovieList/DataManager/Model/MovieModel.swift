import Foundation

// MARK: - MovieDiscoverResponse
struct MovieDiscoverResponse: Codable {
    let page, totalResults, totalPages: Int
    let movieModel: [MovieModel]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movieModel = "results"
    }
}

// MARK: - MovieModel
struct MovieModel: Codable {
    let posterPath: String
    let originalTitle: String

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case posterPath = "poster_path"
    }
}
