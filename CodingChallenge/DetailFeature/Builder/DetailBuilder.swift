//
//  DetailWireframe.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/24/21.
//

import UIKit.UIViewController

class DetailBuilder {
    static func createProductListModule(product: Product) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, product: product)
        view.setPresenter(presenter)
        return view
    }
}
