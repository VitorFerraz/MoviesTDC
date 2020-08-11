//
//  MovieListInpectorTests.swift
//  MoviesTDCTests
//
//  Created by Vitor Ferraz Varela on 11/08/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Quick
import Nimble
import ViewInspector
import SwiftUI
@testable import MoviesTDC

class MovieListInpectorTests: QuickSpec  {
    var sut: MovieListView<MovieListViewModelMock>!

    override func spec() {
        beforeEach {
            let viewModel = MovieListViewModelMock()
            self.sut = MovieListView(viewModel: viewModel)
        }
        describe("MovieList ViewInspector Test") {
            context("in movie list scenne") {
                it("show a list of movies") {
                    do {
                        let list = try self.sut.body.inspect().navigationView().list(0)
                        let numberOfItems = try list.forEach(0).count

                        let firstCell = try cellForRow(at: 0, for: list)
                        let secondCell = try cellForRow(at: 1, for: list)
                        let thirdCell = try cellForRow(at: 2, for: list)

                        expect(list).toNot(beNil())
                        expect(numberOfItems).to(equal(3))
                        expect(titleForCell(cell: firstCell)).to(equal("Bacurau"))
                        expect(titleForCell(cell: secondCell)).to(equal("Avengers: Endgame"))
                        expect(titleForCell(cell: thirdCell)).to(equal("Your Name"))

                    } catch {
                        fail("Fail to inpect view, error: \(error)")
                    }
                }
            }
        }

        func titleForCell(cell: InspectableView<ViewType.View<MovieCell>>) -> String? {
            try? cell.hStack().text(1).string()
        }

        func cellForRow(at index: Int, for list: InspectableView<ViewType.List>) throws -> InspectableView<ViewType.View<MovieCell>> {
            try list.forEach(0).hStack(index).view(MovieCell.self, 0)
        }
    }
}

extension MovieCell: Inspectable {}
