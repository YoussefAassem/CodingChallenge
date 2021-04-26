//
//  ListBuilder.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/25/21.
//

import UIKit

class ListBuilder {
    static func createProductListModule(service: ListServiceProtocol = ListService()) -> UIViewController {
        let view = ListViewController()
        let interactor = ListInteractor(service: service)
        let wireframe = ListWireframe()
        let deps = ListPresenter.Dependencies(view: view, interactor: interactor, wireframe: wireframe)
        let presenter = ListPresenter(dependencies: deps)
        view.setPresenter(presenter)
        interactor.setDelegate(presenter)
        return view
    }
}
