import Foundation

protocol MovieServiceProtocol {
    func searchMovies(with query: String) async throws -> [Movie]
}

actor MovieService: MovieServiceProtocol {
    private let apiKey: String
    private let baseURL: String
    private let session: URLSession
    
    enum MovieError: Error {
        case invalidURL
        case networkError(Error)
        case decodingError(Error)
    }
    
    init(apiKey: String = "002fa132a57542d5b8ef6b1e33b6b956",
         baseURL: String = "https://api.themoviedb.org/3",
         session: URLSession = .shared) {
        self.apiKey = apiKey
        self.baseURL = baseURL
        self.session = session
    }
    
    func searchMovies(with query: String) async throws -> [Movie] {
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
