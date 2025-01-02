import Foundation
import SwiftUI

@Observable class MovieSearchViewModel {
    var searchText = ""
    var movies: [Movie] = []
    var isLoading = false
    var error: Error?
    
    enum MovieServiceError: Error, Equatable {
        case invalidSearchText
        case networkError
    }
    
    enum State: Equatable {
        case idle
        case loading
        case loaded(movies: [Movie])
        case failed(error: MovieServiceError)
    }
    
    private let movieService = MovieService()
    private var searchTask: Task<Void, Never>?
    
    func searchMovies() {
        searchTask?.cancel()
        searchTask = Task {
            do {
                isLoading = true
                error = nil
            
                let results = try await movieService.searchMovies(with: searchText)
                if !Task.isCancelled {
                    withAnimation {
                        movies = results
                    }
                }
            } catch {
                self.error = error
            }
            
            isLoading = false
        }
    }
}

extension MovieSearchViewModel: Identifiable {
    
}
