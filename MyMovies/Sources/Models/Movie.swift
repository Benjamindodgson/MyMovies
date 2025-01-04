import Foundation

import Foundation

/// Represents a movie with its relevant details.
///
/// This struct conforms to the `Model` protocol and provides properties
/// for storing metadata about a movie, including its ID, title, description,
/// poster image, and release date. It also includes a computed property to
/// generate the full URL for the movie's poster image.
///
/// - Note: The `posterPath` and `releaseDate` are optional as they may not
///   always be available.
///
/// ### Properties
/// - `id`: The unique identifier for the movie.
/// - `title`: The title of the movie.
/// - `overview`: A brief summary or description of the movie.
/// - `posterPath`: The relative path to the movie's poster image, if available.
/// - `releaseDate`: The release date of the movie, formatted as a string.
///
/// ### Computed Properties
/// - `posterURL`: Generates the full URL for the movie's poster image using the base URL `https://image.tmdb.org/t/p/w500`.
///
/// ### Coding Keys
/// Maps the JSON keys from the API response to the struct's properties. For instance:
/// - `posterPath` maps to the JSON key `poster_path`.
/// - `releaseDate` maps to the JSON key `release_date`.
struct Movie: Modelable {
    
    /// The unique identifier for the movie.
    let id: Int
    
    /// The title of the movie.
    let title: String
    
    /// A brief summary or description of the movie.
    let overview: String
    
    /// The relative path to the movie's poster image, if available.
    let posterPath: String?
    
    /// The release date of the movie, formatted as a string.
    let releaseDate: String?
    
    /// Computes the full URL for the movie's poster image.
    ///
    /// Combines the base URL `https://image.tmdb.org/t/p/w500` with the
    /// `posterPath` to generate the complete URL. Returns `nil` if
    /// `posterPath` is not available.
    var posterURL: URL? {
        guard let posterPath else { return nil }
        return URL(string: "\(Keys.posterURL)\(posterPath)")
    }
    
    /// Defines how the keys in the JSON response map to the properties in this struct.
    ///
    /// The `CodingKeys` enum is used to rename keys for cases where the JSON
    /// uses snake_case while Swift uses camelCase. For example:
    /// - `posterPath` maps to the JSON key `poster_path`.
    /// - `releaseDate` maps to the JSON key `release_date`.
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
