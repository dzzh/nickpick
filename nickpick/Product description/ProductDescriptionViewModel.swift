//
// Created by Zmicier Zaleznicenka on 24/11/16.
// Copyright (c) 2016 Zmicier. All rights reserved.
//

import Foundation
import ReactiveSwift

class ProductDescriptionViewModel {

    let product: MutableProperty<Product>

    init(product: Product) {
       self.product = MutableProperty<Product>(product)
    }
}
