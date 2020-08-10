import SnapshotTesting
import SwiftUI
import Quick
import Nimble
@testable import MoviesTDC



class MovieListTests: QuickSpec {

    var movieEntity: MovieEntity!

    override func spec() {
        beforeSuite {
        }

        describe("Snapshot MovieList Test") {
            context("in multiple languages") {
                context("and multiple devices") {
                    it("show the movie list") {
                        //                    record = true
                        let devices :[(String, ViewImageConfig)] = [("iPhoneSe",.iPhoneSe),
                                                                    ("iPhone8",.iPhone8),
                                                                    ("iPhone8Plus",.iPhone8Plus)]
                        let languages: [Locale] = [Locale(identifier: "pt-br"),
                                                   Locale(identifier: "en")]

                        languages.forEach { (language) in
                            devices.forEach { device in
                                let contentView = MovieListView(viewModel: MovieListViewModelMock()).environment(\.locale, language)
                                let hostController = UIHostingController(rootView: contentView)
                                let named = "Device-\(device.0)-Language-\(language)"
                                let expectation = XCTestExpectation(description: named)
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 8.0, execute: {
                                    expectation.fulfill()
                                })
                                self.wait(for: [expectation], timeout: .infinity)
                                record = true
                                assertSnapshot(matching: hostController, as: .image(on: device.1), named: named)

                            }
                        }
                    }
                }
            }
        }
    }
}

struct MovieListTests_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
