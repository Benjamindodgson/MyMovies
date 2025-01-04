import Foundation
import SwiftUI

@Observable
class MovieSearchViewModel<Service: Searchable>: ViewModelable {
    
    enum MovieSearchError: Error, Equatable {
        case networkError
        case noResults
    }
    
    enum State: Equatable {
        case idle
        case loading
        case loaded(movies: [Movie])
        case failed(error: MovieSearchError)
    }
    
    var searchText: String = ""
    var state: State = .idle
    
    private let service: Service
    
    init(with service: Service) {
        self.service = service
    }
    
    private var searchTask: Task<Void, Never>?
    func searchMovies(with text: String) {
        searchTask?.cancel()
        searchTask = Task { [weak self] in
            
            guard let self else { return }

            do {
                withAnimation {
                    self.state = .loading
                }
                let results = try await service.search(with: text)
                if !Task.isCancelled {
                    withAnimation {
                        if let movies = results as? [Movie], !movies.isEmpty {
                            self.state = .loaded(movies: movies)
                        } else if !text.isEmpty {
                            self.state = .failed(error: .noResults)
                        } else {
                            self.state = .idle
                        }
                    }
                }
            } catch {
                withAnimation {
                    self.state = .failed(error: .networkError)
                }
            }
        }
    }
}
