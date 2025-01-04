//
//  Modelable.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/2/25.
//

/// A protocol that combines common functionality for models in the application.
///
/// `Modelable` is a protocol that enforces conformance to the following:
/// - `Identifiable`: Requires the type to have a unique identifier.
/// - `Codable`: Enables encoding and decoding of the type to and from data formats like JSON.
/// - `Equatable`: Allows instances of the type to be compared for equality.
///
/// Use `Modelable` for any model in your application that needs to be identifiable, serializable, and comparable.
///
/// ### Example Usage
/// ```swift
/// struct Movie: Modelable {
///     let id: Int
///     let title: String
/// }
///
/// // Example of Codable functionality
/// let movie = Movie(id: 1, title: "Inception")
/// let data = try JSONEncoder().encode(movie)
/// let decodedMovie = try JSONDecoder().decode(Movie.self, from: data)
///
/// // Example of Identifiable functionality
/// print(movie.id) // Prints 1
///
/// // Example of Equatable functionality
/// let anotherMovie = Movie(id: 2, title: "Avatar")
/// print(movie == anotherMovie) // Prints false
/// ```
protocol Modelable: Identifiable, Codable, Equatable {}
