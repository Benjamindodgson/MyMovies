import SwiftUI

struct MovieSearchView<Service: Searchable>: View {
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

#Preview {
    MovieSearchView(viewModel: MovieSearchViewModel(with: MockMovieService()))
}

private struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: movie.posterURL) { image in
                image.resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .containerRelativeFrame(.horizontal, count: 6, spacing: 8)
            } placeholder: {
                Color.gray
                    .aspectRatio(2/3, contentMode: .fit)
                    .containerRelativeFrame(.horizontal, count: 6, spacing: 8)
            }
            
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
