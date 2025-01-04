//
//  MovieResponse.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/4/25.
//

/// Represents the response structure for a list of movies.
///
/// This struct conforms to the `Codable` protocol, allowing it to parse
/// JSON data directly into a `MovieResponse` object. It encapsulates
/// an array of `Movie` objects returned by the API.
///
/// ### Properties
/// - `results`: An array of `Movie` objects representing the movies in the response.
struct MovieResponse: Codable {
    /// The array of movies in the response.
    let results: [Movie]
}
