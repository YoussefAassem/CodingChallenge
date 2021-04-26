//
//  DetailViewMock.swift
//  CodingChallengeTests
//
//  Created by Youssef AASSEM on 4/26/21.
//

@testable import CodingChallenge
import Foundation

class DetailViewMock: DetailViewProtocol {
    var viewData: DetailViewData?
    var isViewUpdated = false
    func update(with viewData: DetailViewData) {
        self.viewData = viewData
        self.isViewUpdated = true
    }

    func setPresenter(_ presenter: DetailPresenterProtocol) {}
}
