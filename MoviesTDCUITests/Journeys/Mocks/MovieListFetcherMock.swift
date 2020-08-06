import Combine
import Foundation
class MovieListFetcherMock {
    let movieListSub = PassthroughSubject<MovieDiscoverResponse, Error>()
}

extension MovieListFetcherMock: MovieFetchable {
    func loadMovies() -> AnyPublisher<MovieDiscoverResponse, Error> {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
            self.movieListSub.send(MovieDiscoverResponse(page: 0, totalResults: 0, totalPages: 0, movieModel: [
                MovieModel(posterPath: "/fMMrl8fD9gRCFJvsx0SuFwkEOop.jpg"
                    , originalTitle: "Fantastic Beasts: The Crimes of Grindelwald"),
                MovieModel(posterPath: "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg", originalTitle: "The Kissing Booth 2"),
                MovieModel(posterPath: "/kjMbDciooTbJPofVXgAoFjfX8Of.jpg", originalTitle: "Greyhound")]))
        })
        return movieListSub.eraseToAnyPublisher()
    }
}
