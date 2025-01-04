//
//  Keys.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/4/25.
//

/// A struct that contains constant values for API configuration.
///
/// The `Keys` struct provides a centralized location for storing static constants
/// used throughout the application, particularly for interacting with external APIs.
///
/// ### Properties
/// - `apiKey`: A `String` representing the API key for authenticating requests to the external movie database.
/// - `searchURL`: A `String` containing the base URL for the search API endpoint.
/// - `posterURL`: A `String` representing the base URL for retrieving poster images.
///
/// ### Purpose
/// By using the `Keys` struct, developers can avoid hardcoding configuration values
/// throughout the codebase, simplifying updates and maintaining cleaner, more readable code.
///
/// - Note: For security purposes, it is recommended to avoid hardcoding sensitive values
/// like `apiKey` in source code directly, especially in production environments.
///
/// ### Example Usage
/// ```swift
/// let apiKey = Keys.apiKey
/// let searchEndpoint = "\(Keys.searchURL)/search/movie"
/// let posterFullURL = "\(Keys.posterURL)/{poster_path}"
/// ```
struct Keys {
    /// The API key for authenticating requests to the external movie database.
    static let apiKey = "002fa132a57542d5b8ef6b1e33b6b956"
    /// The base URL for the movie database API.
    static let searchURL = "https://api.themoviedb.org/3"
    /// The base URL for retrieving poster images.
    static let posterURL = "https://image.tmdb.org/t/p/w500"
}
