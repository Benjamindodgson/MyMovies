//
//  MovieSearchView.swift
//  MyMovies
//
//  Created by Benjamin Dodgson on 1/4/25.
//

import SwiftUI

/// A view that provides a searchable interface for browsing movies.
///
/// `MovieSearchView` is a SwiftUI component designed to handle searching, loading,
/// and displaying movie results. It interacts with a `Searchable` service to fetch
/// movie data based on user input.
///
/// ### Generic Parameters
/// - `Service`: A type conforming to the `Searchable` protocol, used for fetching
///   movie data.
///
/// ### Properties
/// - `viewModel`: An instance of `MovieSearchViewModel` that manages the search logic
///   and holds the current state of the view.
///
/// ### States
/// The view reacts to changes in the `viewModel.state` property, which can be one of the following:
/// - `.idle`: Displays an empty placeholder message.
/// - `.loading`: Shows a loading spinner while data is being fetched.
/// - `.loaded`: Displays a list of movie results when data is successfully fetched.
/// - `.failed`: Shows an error message if the search operation fails.
///
/// ### Components
/// - `NavigationView`: Wraps the content to provide navigation capabilities.
/// - `Group`: Used to manage the conditional UI based on the state of the `viewModel`.
/// - `List`: Displays the movie results using `MovieRowView`.
/// - `searchable`: Provides a search bar for querying movies.
///
/// ### Example Usage
/// ```swift
/// MovieSearchView(viewModel: MovieSearchViewModel(service: MovieService()))
/// ```
///
/// ### Interactivity
/// - `searchable`: Allows users to enter search terms to find movies.
/// - `onChange`: Listens for changes in the search text and triggers the search logic.
///
/// ### Customization
/// The behavior and appearance of `MovieSearchView` can be customized by providing a different
/// implementation of the `Searchable` protocol for the `Service` type.
///
/// - Note: The `viewModel.state` must be kept updated based on the service's results
///   to ensure the UI reacts appropriately.
struct MovieSearchView<Service: Searchable>: View {
    /// The view model managing the state and logic of the search view.
    @State var viewModel: MovieSearchViewModel<Service>
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle:
                    Text("Empty")
                case .loading:
                    ProgressView()
                        .transition(.opacity)
                case .loaded(let movies):
                    List(movies) { movie in
                        MovieRowView(movie: movie)
                    }
                    .transition(.opacity)
                case .failed(let error):
                    Text("Error: \(error)")
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut, value: viewModel.state == .loading)
            .searchable(text: $viewModel.searchText,
                        placement: .sidebar,
                        prompt: "Search movies")
            .onChange(of: viewModel.searchText, { old, new in
                viewModel.searchMovies(with: new)
            })
            .navigationTitle("Movies")
        }
    }
}

/// A preview of the `MovieSearchView` with a mock service.
#Preview {
    MovieSearchView(viewModel: MovieSearchViewModel(with: MockMovieService()))
}
