import SwiftUI

struct MovieListView<ViewModel>: View where ViewModel: MovieListViewModelProtocol {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(self.viewModel.movies.indexed(), id: \.element.name) { index, movie in
                MovieCell(movie: movie)
                    .accessibility(identifier: "Cell [\(index)]")
            }
            .accessibility(identifier: "MovieListTable")
            .navigationBarTitle("Movie List")
        }
    }
}


