//
//  ProductListViewModel.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import Foundation
import Moya
import ReactiveSwift
import SwiftyJSON
import UIKit.UICollectionView

let productListCellId = "ProductCell"

enum ProductListState {
    case normal
    case empty
    case loading
    case error
}

class ProductListViewModel: NSObject {

    let productProvider = MoyaProvider<ProductService>()
    var products = MutableProperty<[Product]>([])
    var state: MutableProperty<ProductListState> = MutableProperty<ProductListState>(.empty)

    //TODO results caching
    func fetchProducts() {
        state.value = .loading
        productProvider.request(.list) { result in
            switch result {
                case let .success(moyaResponse):
                    if moyaResponse.statusCode == 200 { //TODO better status code filtering
                        if let productList = self.parseProducts(from: moyaResponse.data) {
                            self.products.value = productList
                            self.state.value = productList.count > 0 ? .normal : .empty
                        } else {
                            self.toErrorState()
                        }
                    } else {
                        self.toErrorState()
                    }
                case .failure(_):
                    self.toErrorState()
            }
        }
    }

    // Here we don't fetch full product details and only
    // work with data coming from product list call. These data
    // is enough to initialize details controller without network delay.
    func product(index: Int) -> Product? {
        return products.value.count > index ? products.value[index] : nil
    }

    // MARK: Private (Parsing helpers)

    func parseProducts(from data: Data) -> [Product]? {
        var result = [Product]()

        let json = JSON(data: data)
        if json != JSON.null {
            for productJson in json["products"].arrayValue {
                if let product = Product.from(json: productJson) {
                    result.append(product)
                }
            }
        } else {
            return nil
        }

        return result
    }

    // MARK: Private (State helpers)

    private func toErrorState() {
        products.value = []
        state.value = .error
    }
}

extension ProductListViewModel: UICollectionViewDataSource {

    // MARK: Protocol implementation

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return products.value.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productListCellId,
                for: indexPath) as! ProductListCollectionViewCell
        cell.update(with: products.value[indexPath.row])
        return cell
    }

}
