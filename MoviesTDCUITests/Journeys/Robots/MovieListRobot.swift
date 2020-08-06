import XCTest
import Nimble

class MovieListRobot: Robot {
    private lazy var navigationBar = app.navigationBars["Movie List"]
    private lazy var list = app.otherElements["MovieListTable"].tables.firstMatch.cells

    @discardableResult
    func checkViewTitleIs(_ title: String) -> Self {
        expect(self.navigationBar.staticTexts[title].exists).to(beTrue())
        return self
    }

    @discardableResult
    func checkCellTitleAt(index: Int, is title: String) -> Self {
        let cell = list.staticTexts["Cell [\(index)]"]
        expect(cell.label).to(equal(title))
        return self
    }

    @discardableResult
    func checkCellsCountEqual(_ value: Int) -> Self {
        expect(self.list.count).to(equal(value))
        return self
    }

}
