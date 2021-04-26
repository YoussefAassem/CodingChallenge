//
//  ListPresenterTest.swift
//  CodingChallengeTests
//
//  Created by Youssef AASSEM on 4/26/21.
//

@testable import CodingChallenge
import XCTest

class ListPresenterTest: XCTestCase {
    var presenter: ListPresenter?
    let view = ListViewMock()
    override func setUpWithError() throws {
        let interactor = ListInteractor(service: ListService())
        let wireframe = ListWireframe()
        let deps = ListPresenter.Dependencies(view: view, interactor: interactor, wireframe: wireframe)
        self.presenter = ListPresenter(dependencies: deps)
        guard let presenter = self.presenter else { return }
        view.setPresenter(presenter)
        interactor.setDelegate(presenter)
    }

    func testDidFetch() throws {
        let products = [Product(itemId: "p1", value: "100", currency: "MAD", title: "First product", description: LocalizedString(enLabel: "desc", frLabel: "desc")),
                        Product(itemId: "p2", value: "150", currency: "CAD", title: "Second product", description: LocalizedString(enLabel: "desc", frLabel: "desc"))]
        presenter?.didFetch(products)
        XCTAssert(view.products.count > 0)
    }

    func testDidFail() throws {
        let error = ErrorModel.remoteHostError
        presenter?.didFail(with: error)
        XCTAssertEqual(view.products.count, 0)
        XCTAssertEqual(view.error, error.rawValue)
    }
}
