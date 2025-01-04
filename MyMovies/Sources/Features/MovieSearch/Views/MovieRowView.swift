//
//  MovieRowView.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/4/25.
//

import SwiftUI

/// A view that displays a row of movie information.
///
/// `MovieRowView` is a SwiftUI component designed to present a movie's poster image, title,
/// and release date in a horizontally aligned layout. It is commonly used within lists
/// or other vertically scrolling containers to represent individual movies.
///
/// ### Properties
/// - `movie`: An instance of the `Movie` model containing the movie's details.
///
/// ### Layout
/// The view is composed of two main sections:
/// - **Poster Image**: Displayed on the left side as a resizable image fetched asynchronously using `AsyncImage`.
///   If the image is unavailable, a gray placeholder is shown instead.
/// - **Movie Details**: Positioned to the right of the poster image, showing the movie's title and optional release date.
///
/// ### Example Usage
/// ```swift
/// let sampleMovie = Movie(
///     id: 1,
///     title: "Inception",
///     posterPath: "/poster.jpg",
///     releaseDate: "2010-07-16"
/// )
///
/// MovieRowView(movie: sampleMovie)
/// ```
///
/// ### Customization
/// This view can be modified or embedded within other SwiftUI containers like `List` or `ScrollView`.
///
/// ### Components
/// - `AsyncImage`: Used to load the movie's poster image from a URL asynchronously.
/// - `Text`: Displays the movie's title and release date.
///
/// - Note: Ensure the `Movie` model includes valid `posterURL` and `releaseDate` values
///   for accurate display. If `releaseDate` is `nil`, it is omitted from the view.
struct MovieRowView: View {
    /// The movie data to display in the row.
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 10) {
            // Asynchronous poster image with placeholder fallback
            AsyncImage(url: movie.posterURL) { image in
                image.resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .containerRelativeFrame(.horizontal, count: 6, spacing: 8)
            } placeholder: {
                Color.gray
                    .aspectRatio(2/3, contentMode: .fit)
                    .containerRelativeFrame(.horizontal, count: 6, spacing: 8)
            }
            
            // Movie title and release date
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                if let releaseDate = movie.releaseDate {
                    Text(releaseDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
