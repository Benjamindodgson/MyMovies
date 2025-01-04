import Foundation

/// A service for fetching movie data from an external API.
///
/// `MovieService` is an actor that conforms to the `Searchable` protocol and provides
/// asynchronous methods to search for movies using a query string. The service handles
/// network requests, JSON decoding, and error management.
///
/// This actor is designed to work with the external movie database API, utilizing
/// an API key and a base URL for requests.
///
/// ### Typealiases
/// - `Result`: The type of the result returned by the `search` method, aliased to `Movie`.
///
/// ### Properties
/// - `apiKey`: The API key used for authenticating requests.
/// - `baseURL`: The base URL for the movie database API.
/// - `session`: The `URLSession` instance used for network requests.
///
/// ### Errors
/// The `MovieError` enum defines the following error cases:
/// - `invalidURL`: Thrown when the URL for a network request cannot be constructed.
/// - `networkError`: Thrown when there is an issue with the network request. Contains the underlying `Error`.
/// - `decodingError`: Thrown when there is an issue decoding the JSON response. Contains the underlying `Error`.
///
/// ### Methods
/// - `init(apiKey:baseURL:session:)`: Initializes the service with an API key, base URL, and a URL session.
/// - `search(with:)`: Searches for movies based on a query string and returns a list of `Movie` objects.
/// - `getURL(for:)`: Constructs a URL for a given search query.
///
/// ### Example Usage
/// ```swift
/// let service = MovieService(apiKey: "your_api_key")
/// do {
///     let movies = try await service.search(with: "Inception")
///     print(movies)
/// } catch {
///     print("Error searching for movies: \(error)")
/// }
/// ```
actor MovieService: Searchable {
    /// The type of result returned by the `search` method.
    typealias Result = Movie

    /// The API key used for authenticating requests.
    private let apiKey: String

    /// The base URL for the movie database API.
    private let baseURL: String

    /// The `URLSession` instance used for network requests.
    private let session: URLSession

    /// Errors specific to the `MovieService`.
    enum MovieError: Error {
        /// Thrown when the URL for a network request cannot be constructed.
        case invalidURL

        /// Thrown when there is an issue with the network request.
        /// Contains the underlying `Error`.
        case networkError(Error)

        /// Thrown when there is an issue decoding the JSON response.
        /// Contains the underlying `Error`.
        case decodingError(Error)
    }

    /// Initializes the service with an API key, base URL, and a URL session.
    ///
    /// - Parameters:
    ///   - apiKey: The API key for authenticating requests. Defaults to `Keys.apiKey`.
    ///   - baseURL: The base URL for the API. Defaults to `Keys.searchURL`.
    ///   - session: The `URLSession` instance for network requests. Defaults to `.shared`.
    init(apiKey: String = Keys.apiKey,
         baseURL: String = Keys.searchURL,
         session: URLSession = .shared) {
        self.apiKey = apiKey
        self.baseURL = baseURL
        self.session = session
    }

    /// Searches for movies based on a query string.
    ///
    /// - Parameter query: A string representing the search query.
    /// - Returns: An array of `Movie` objects matching the query.
    /// - Throws: Throws a `MovieError` if the request fails due to an invalid URL,
    ///   network error, or decoding error.
    func search(with query: String) async throws -> [Movie] {
        do {
            let url = try getURL(for: query)
            let (data, _) = try await session.data(from: url)
            let response = try JSONDecoder().decode(MovieResponse.self, from: data)
            return response.results
        } catch let error as DecodingError {
            throw MovieError.decodingError(error)
        } catch let error as URLError {
            throw MovieError.networkError(error)
        } catch {
            throw error // Re-throw any unexpected errors
        }
    }

    /// Constructs a URL for a given search query.
    ///
    /// - Parameter query: A string representing the search query.
    /// - Returns: A valid `URL` for the search request.
    /// - Throws: Throws `MovieError.invalidURL` if the URL cannot be constructed.
    private func getURL(for query: String) throws -> URL {
        guard let url = URL(string: "\(baseURL)/search/movie")?.appending(queryItems: [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: query)
        ]) else {
            throw MovieError.invalidURL
        }
        return url
    }
}

/// A mock implementation of the `Searchable` protocol for testing purposes.
///
/// This actor conforms to the `Searchable` protocol and provides a simple
/// implementation of the `search` method. It returns an empty array of movies
/// to simulate a search operation.
///
/// Use `MockMovieService` to test components that depend on the `Searchable` protocol
/// without making real network calls or requiring an actual backend service.
///
/// ### Typealiases
/// - `Result`: The type of the result returned by the `search` method. It is aliased to `Movie`.
///
/// ### Methods
/// - `search(with:)`: Simulates a search operation and always returns an empty array.
///
/// Example usage:
/// ```swift
/// let service = MockMovieService()
/// let movies = try await service.search(with: "query")
/// assert(movies.isEmpty) // Always true for the mock implementation
/// ```
actor MockMovieService: Searchable {
    /// The type of result returned by the `search` method.
    typealias Result = Movie
    
    /// Simulates a search operation by returning an empty array.
    ///
    /// This method conforms to the `Searchable` protocol's requirement for
    /// performing a search operation. In this mock implementation, the method
    /// ignores the input query and always returns an empty array.
    ///
    /// - Parameter query: A `String` representing the search query. Ignored in this implementation.
    /// - Returns: An empty array of `Movie` objects.
    /// - Throws: This implementation never throws.
    func search(with query: String) async throws -> [Movie] {
        return []
    }
}
