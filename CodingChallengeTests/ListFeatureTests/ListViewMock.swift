//
//  ListViewMock.swift
//  CodingChallengeTests
//
//  Created by Youssef AASSEM on 4/26/21.
//
@testable import CodingChallenge
import Foundation

class ListViewMock: ListViewProtocol {
    var error: String = ""
    var products: [ListViewData] = []
    var isTableViewRefreshed = false
    
    func setPresenter(_ presenter: ListPresenterProtocol) {}
    
    func showError(_ error: String) {
        self.error = error
    }
    
    func show(_ viewData: [ListViewData]) {
        self.products = viewData
        self.isTableViewRefreshed = true
    }
}
