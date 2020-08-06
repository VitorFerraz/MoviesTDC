import Combine
import Foundation


protocol MovieListViewModelProtocol: ObservableObject {
    func loadMovies()
    var movies: [MovieEntity] { get }
}

class MovieListFetcherFactory {
    static var shared: MovieFetchable = MovieFetcher()
}

class MovieListViewModel: MovieListViewModelProtocol {
    @Published var movies: [MovieEntity] = []
    private var cancellable: AnyCancellable?
    private var movieFetcher: MovieFetchable = MovieListFetcherFactory.shared

    init() {
        loadMovies()
    }

    func loadMovies() {
          cancellable = movieFetcher
            .loadMovies()
            .map { self.convertMovieResponseToMovieEntity(movieResponse: $0) }
            .replaceError(with: [])
            .assign(to: \.movies, on: self)
    }

    func convertMovieResponseToMovieEntity(movieResponse: MovieDiscoverResponse) -> [MovieEntity] {
        movieResponse.movieModel.map { movie in
            MovieEntity(posterUrl: "https://image.tmdb.org/t/p/w500/" + movie.posterPath, name: movie.originalTitle)
        }
    }
}
