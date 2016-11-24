//
// Created by Zmicier Zaleznicenka on 24/11/16.
// Copyright (c) 2016 Zmicier. All rights reserved.
//

import Foundation
import Moya
import ReactiveSwift
import SwiftyJSON

class ProductDescriptionViewModel {

    let productProvider = MoyaProvider<ProductService>()
    let product: MutableProperty<Product>

    // MARK: Initialization

    init(product: Product) {
        self.product = MutableProperty<Product>(product)

        // view model is initialized with product coming from list request
        // that doesn't have all the fields resolved, hence we need
        // to immediately update it with the rest of data
        fetchProduct(withId: product.id)
    }

    // MARK: Interface

    func fetchProduct(withId id: Int) {
        productProvider.request(.details(id: id)) { result in

            // TODO it's not really that important to handle error cases here like
            // in the list screen because we anyway have short version of data;
            // however, some nice message if description cannot be fetched wouldn't hurt
            switch result {
                case let .success(moyaResponse):
                    if moyaResponse.statusCode == 200 { //TODO better status code filtering
                        if let productValue = self.parseProduct(from: moyaResponse.data) {
                            self.product.value = productValue
                        }
                    }
                case .failure(_):
                    break // TODO error handling
            }
        }
    }

    // MARK: Private (Parsing helpers)

    private func parseProduct(from data: Data) -> Product? {
        let json = JSON(data: data)
        guard json != JSON.null else { return nil }
        guard let product = Product.from(json: json) else { return nil }

        return product
    }
}
