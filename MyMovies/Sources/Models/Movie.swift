import Foundation

struct Movie: Model {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String?
    
    var posterURL: URL? {
        guard let posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

extension Movie {
    static var mock: Movie {
        Movie(id: 1, title: "Mock Movie", overview: "Mock Overview", posterPath: nil, releaseDate: nil)
    }
}

struct MovieResponse: Codable {
    let results: [Movie]
}
