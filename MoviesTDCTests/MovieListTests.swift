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
                                assertSnapshot(matching: hostController, as: .windowedImage)
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                                    expectation.fulfill()
                                })
                                self.wait(for: [expectation], timeout: .infinity)
                                record = true
                                let width = device.1.size?.width ?? 0.0
                                let height = device.1.size?.height ?? 0.0
                                assertSnapshot(matching: hostController, as: .image(size: CGSize(width: width, height: height)), named: named)
                            }
                        }
                    }
                }
            }
        }
    }
}
