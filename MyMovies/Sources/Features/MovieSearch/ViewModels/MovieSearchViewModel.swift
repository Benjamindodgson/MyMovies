import Foundation
import SwiftUI

/// A view model responsible for managing the movie search functionality.
///
/// `MovieSearchViewModel` provides the logic and state management for a movie search view.
/// It interacts with a `Searchable` service to perform asynchronous search operations and updates the state
/// of the view based on the results or errors.
///
/// ### Generic Parameters
/// - `Service`: A type conforming to the `Searchable` protocol, used to fetch movies based on search queries.
///
/// ### States
/// The `State` enum defines the possible states of the view:
/// - `idle`: No search has been initiated.
/// - `loading`: A search operation is in progress.
/// - `loaded`: Movies have been successfully fetched and are ready to display.
/// - `failed`: The search operation failed, either due to a network error or no results.
///
/// ### Error Handling
/// The `MovieSearchError` enum defines two possible error cases:
/// - `networkError`: Indicates a network-related failure during the search.
/// - `noResults`: Indicates that no movies were found for the given search query.
///
/// ### Example Usage
/// ```swift
/// let viewModel = MovieSearchViewModel(service: MovieService())
/// viewModel.searchMovies(with: "Inception")
/// print(viewModel.state) // Outputs the updated state after performing the search
/// ```
@Observable
class MovieSearchViewModel<Service: Searchable>: ViewModelable {
    
    /// Errors that can occur during the movie search process.
    enum MovieSearchError: Error, Equatable {
        /// Indicates a network-related error.
        case networkError
        /// Indicates that no results were found for the given query.
        case noResults
    }
    
    /// The various states the view can be in during the search process.
    enum State: Equatable {
        /// The view is idle, with no ongoing search operation.
        case idle
        /// A search operation is currently in progress.
        case loading
        /// Movies have been successfully fetched.
        case loaded(movies: [Movie])
        /// The search operation failed with a specific error.
        case failed(error: MovieSearchError)
    }
    
    /// The current search text entered by the user.
    var searchText: String = ""
    
    /// The current state of the search view.
    var state: State = .idle
    
    /// The service used to perform the search operation.
    private let service: Service
    
    /// Initializes the view model with the given service.
    ///
    /// - Parameter service: An instance of a type conforming to the `Searchable` protocol.
    init(with service: Service) {
        self.service = service
    }
    
    /// A task used to handle the ongoing search operation.
    private var searchTask: Task<Void, Never>?
    
    /// Initiates a search operation with the provided search text.
    ///
    /// - Parameter text: The search query entered by the user.
    ///
    /// The method:
    /// - Cancels any ongoing search task.
    /// - Sets the state to `.loading` while the search is performed.
    /// - Updates the state to `.loaded` if movies are found, or `.failed` if no results or errors occur.
    func searchMovies(with text: String) {
        // Cancel any ongoing search task to avoid redundant or overlapping operations.
        searchTask?.cancel()
        
        // Start a new search task.
        searchTask = Task { [weak self] in
            guard let self else { return }

            do {
                // Set the state to loading with animation for a better user experience.
                withAnimation {
                    self.state = .loading
                }
                
                // Perform the search operation using the service.
                let results = try await service.search(with: text)
                
                if !Task.isCancelled {
                    withAnimation {
                        if let movies = results as? [Movie], !movies.isEmpty {
                            // Successfully fetched movies.
                            self.state = .loaded(movies: movies)
                        } else if !text.isEmpty {
                            // No results found for the given query.
                            self.state = .failed(error: .noResults)
                        } else {
                            // If the search text is empty, reset to idle state.
                            self.state = .idle
                        }
                    }
                }
            } catch {
                // Handle any errors by setting the state to failed with a network error.
                withAnimation {
                    self.state = .failed(error: .networkError)
                }
            }
        }
    }
}
