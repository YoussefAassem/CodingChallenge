//
//  DetailPresenterTest.swift
//  CodingChallengeTests
//
//  Created by Youssef AASSEM on 4/26/21.
//

@testable import CodingChallenge
import XCTest

class DetailPresenterTest: XCTestCase {
    let view = DetailViewMock()
    var systemUnderTest: DetailPresenter?

    override func setUpWithError() throws {
        let product = Product(itemId: "p1", value: "100", currency: "MAD", title: "First product", description: LocalizedString(enLabel: "desc", frLabel: "desc"))
        systemUnderTest = DetailPresenter(view: view, product: product)
    }

    func testUpdateView() throws {
        systemUnderTest?.updateView()
        XCTAssertNotNil(view.viewData)
        XCTAssertTrue(view.isViewUpdated)
    }
}
