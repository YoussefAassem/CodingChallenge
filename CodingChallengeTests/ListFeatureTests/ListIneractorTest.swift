//
//  ListIneractorTest.swift
//  CodingChallengeTests
//
//  Created by Youssef AASSEM on 4/26/21.
//

@testable import CodingChallenge
import XCTest

class ListIneractorTest: XCTestCase {
    var interactor: ListInteractor?
    override func setUpWithError() throws {
        interactor = ListInteractor(service: ListService())
        interactor?.setDelegate(self)
    }

    func testFetchProductSuccess() throws {
        interactor?.fetchProducts()
    }
}

extension ListIneractorTest: ListInteractorDelegate {
    func didFail(with error: ErrorModel) {
        XCTFail("It should retrieve data")
    }

    func didFetch(_ products: [Product]) {
        XCTAssert(products.count > 0)
    }
}
