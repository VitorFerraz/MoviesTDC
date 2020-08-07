import SnapshotTesting
import SwiftUI
import Quick
import Nimble
@testable import MoviesTDC


private let referenceSize = CGSize(width: UIScreen.main.bounds.width, height: 170)

class MovieCellTests: QuickSpec {

    var movieEntity: MovieEntity!

    override func spec() {
        beforeSuite {
            self.movieEntity = MovieListViewModelMock().movies[0]
        }

        describe("Snapshot MovieList Test") {
            context("in movie cell") {
                it("show a title and placeholder image") {
//                    record = true
                    assertSnapshot(
                        matching: MovieCell(movie: self.movieEntity).referenceFrame(),
                        as: .image(size: referenceSize)
                    )
                }
            }
        }
    }
}
private extension SwiftUI.View {
    func referenceFrame() -> some View {
        self.frame(width: referenceSize.width, height: referenceSize.height)
    }
}
