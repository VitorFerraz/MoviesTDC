import Combine
import Foundation

protocol MovieFetchable {
func loadMovies() -> AnyPublisher<MovieDiscoverResponse, Error>
}

class MovieFetcher {
  private let session: URLSession

  init(session: URLSession = .shared) {
    self.session = session
  }
}

extension MovieFetcher: MovieFetchable {
    func loadMovies() -> AnyPublisher<MovieDiscoverResponse, Error> {
        let baseUrl = "https://api.themoviedb.org/3/discover/movie"
        let apiKey = "?api_key=305517763634d75923ab75f2c23235b5"
        let path = "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
        let url = URL(string: baseUrl + apiKey + path)!

        return session.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: MovieDiscoverResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()

    }
}
