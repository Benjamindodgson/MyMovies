//
//  Searchable.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/4/25.
//

/// A protocol for performing asynchronous search operations.
///
/// The `Searchable` protocol defines a generic interface for searching and retrieving
/// results based on a query string. Types conforming to this protocol must specify
/// a `Result` type that conforms to the `Modelable` protocol and implement the
/// `search(with:)` method.
///
/// ### Associated Types
/// - `Result`: The type of the items returned by the search operation. Must conform to `Modelable`.
///
/// ### Methods
/// - `search(with:)`: Performs a search operation based on the given query string and returns an array of results.
///
/// ### Example Usage
/// ```swift
/// struct Movie: Modelable {
///     let id: Int
///     let title: String
/// }
///
/// struct MovieService: Searchable {
///     typealias Result = Movie
///
///     func search(with query: String) async throws -> [Movie] {
///         // Example implementation: Fetch movies from a server
///         return [Movie(id: 1, title: "Inception"), Movie(id: 2, title: "Avatar")]
///     }
/// }
///
/// // Using the protocol
/// let service = MovieService()
/// let movies = try await service.search(with: "Sci-Fi")
/// print(movies) // Prints movies matching the query
/// ```
///
/// ### Use Cases
/// Use the `Searchable` protocol for any data source or service that supports searching.
/// Examples include:
/// - Fetching movies by title from an API.
/// - Searching local data like books, songs, or contacts.
/// - Implementing mock services for testing.
///
/// ### Requirements
/// - Types conforming to `Searchable` must define a `Result` type that conforms to `Modelable`.
/// - Implement the `search(with:)` method to handle the search logic and return results asynchronously.
protocol Searchable {
    /// The type of the items returned by the search operation.
    associatedtype Result: Modelable

    /// Performs a search operation based on the given query string.
    ///
    /// - Parameter query: A string representing the search query.
    /// - Returns: An array of `Result` items matching the query.
    /// - Throws: Throws an error if the search operation fails.
    func search(with query: String) async throws -> [Result]
}
