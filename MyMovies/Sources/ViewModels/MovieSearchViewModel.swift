import Foundation
import SwiftUI

@Observable
class MovieSearchViewModel: ViewModel {
                
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
    
    private let service: MovieServiceProtocol
    
    init(with service: MovieServiceProtocol) {
        self.service = service
    }
    
    private var searchTask: Task<Void, Never>?
    func searchMovies(with text: String) {
        searchTask?.cancel()
        searchTask = Task { [weak self] in
            
            guard let self else { return }

            do {
                state = .loading
                let results = try await service.searchMovies(with: text)
                if !Task.isCancelled {
                    withAnimation {
                        if results.isEmpty {
                            self.state = .failed(error: .noResults)
                        } else {
                            self.state = .loaded(movies: results)
                        }
                    }
                }
            } catch {
                self.state = .failed(error: .networkError)
            }
        }
    }
}
