//
//  ProductListViewModel.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import Foundation
import UIKit.UICollectionView

let productListCellId = "ProductCell"

class ProductListViewModel: NSObject {

    let productService: ProductService
    var products = [Product]()

    init(productService: ProductService) {
        self.productService = productService
    }

    // TODO async calls
    func updateProducts() {
        products = productService.list()
    }

    func product(id: Int) -> Product? {
        return productService.product(id: id)
    }
}

extension ProductListViewModel: UICollectionViewDataSource {

    // MARK: Protocol implementation

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productListCellId,
                for: indexPath) as! ProductListCollectionViewCell
        cell.update(with: products[indexPath.row])
        return cell
    }

}
