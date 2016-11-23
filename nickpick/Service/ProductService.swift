//
//  ProductService.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import Foundation
import UIKit.UIImage

class ProductService {

    let endpoint: String

    init() {
        endpoint = ProductService.endpointString()
    }

    func list() -> [Product] {
        var result = [Product]()
        result.append(Product(id: 1, name: "First", description: "", imageUrl: "1.png", priceInCents: 100))
        result.append(Product(id: 2, name: "Second", description: "", imageUrl: "2.png", priceInCents: 299))
        result.append(Product(id: 3, name: "Third", description: "", imageUrl: "3.png", priceInCents: 21))
        return result
    }

    func product(id: Int) -> Product? {
        return Product(id: 1, name: "First", description: "First description", imageUrl: "1.png", priceInCents: 100)
    }

    // MARK: Private (Helpers)

    private static func endpointString() -> String {
        guard let dict = Bundle.main.infoDictionary else { return "" }
        guard let value = dict["RestServiceEndpoint"] as? String else { return "" }
        return value
    }
}
