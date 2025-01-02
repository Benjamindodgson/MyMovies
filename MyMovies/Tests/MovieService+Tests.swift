import XCTest
@testable import MyMovies

class MovieServiceTests: XCTestCase {
    
    func testMovieSearch() async throws {
        // Create a mock URLSession first
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        
        // Create the service with the mock session
        let service = MovieService(session: session)
        
        // Set up the mock response
        let mockMovie = Movie(id: 1, title: "Star Wars: A New Hope", overview: "Test", posterPath: nil)
        let mockResponse = MovieResponse(results: [mockMovie])
        let mockData = try JSONEncoder().encode(mockResponse)
        
        MockURLProtocol.mockData = mockData
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://api.themoviedb.org/3/search/movie")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        // Perform the test
        let movies = try await service.searchMovies(with: "Star Wars")
        
        XCTAssertFalse(movies.isEmpty)
        XCTAssertTrue(movies.contains { $0.title.contains("Star Wars") })
    }
}

private class MockURLProtocol: URLProtocol {
    
    static var mockData: Data?
    static var mockResponse: URLResponse?
    static var mockError: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.mockError {
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        if let data = MockURLProtocol.mockData {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let response = MockURLProtocol.mockResponse {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
