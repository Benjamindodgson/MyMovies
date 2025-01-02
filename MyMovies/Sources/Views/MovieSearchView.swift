import SwiftUI

struct MovieSearchView: View {
    @State var viewModel: MovieSearchViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .transition(.opacity)
                } else {
                    List(viewModel.movies) { movie in
                        MovieRowView(movie: movie)
                    }
                    .transition(.opacity)
                }
            }
            .animation(.easeInOut, value: viewModel.isLoading)
            .searchable(text: $viewModel.searchText, prompt: "Search movies")
            .onChange(of: viewModel.searchText, { old, new in
                
                viewModel.searchMovies()
            })
            .navigationTitle("Movie Search")
        }
    }
}

#Preview {
    MovieSearchView(viewModel: MovieSearchViewModel())
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
