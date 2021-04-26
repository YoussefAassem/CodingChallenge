//
//  ListWireframe.swift
//  CodingChallenge
//
//  Created by Youssef AASSEM on 4/23/21.
//

import UIKit.UIViewController

protocol ListWireframeProtocol: AnyObject {
    func pushToProductDetail(with product: Product, navigationController: UINavigationController?)
}

class ListWireframe: ListWireframeProtocol {
    func pushToProductDetail(with product: Product, navigationController: UINavigationController?) {
        let viewController = DetailBuilder.createProductListModule(product: product)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
