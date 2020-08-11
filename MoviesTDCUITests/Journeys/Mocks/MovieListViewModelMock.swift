
import SwiftUI
import Combine

class MovieListViewModelMock: MovieListViewModelProtocol {
    @Published var movies: [MovieEntity] = []
    private var cancellable: AnyCancellable?

    init() {
        loadMovies()
    }

    func loadMovies() {
        self.movies = [
            MovieEntity(posterUrl: "https://i.pinimg.com/474x/10/67/e0/1067e05abb594b199fab8f6f8524885f.jpg", name: "Bacurau"),
            MovieEntity(posterUrl: "https://images-na.ssl-images-amazon.com/images/I/81ai6zx6eXL._AC_SY679_.jpg", name: "Avengers: Endgame"),
            MovieEntity(posterUrl: "https://upload.wikimedia.org/wikipedia/pt/7/7f/Kimi-no-Na-wa-poster.jpg", name: "Your Name")
        ]
    }
}
