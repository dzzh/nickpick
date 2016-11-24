//
// Created by Zmicier Zaleznicenka on 24/11/16.
// Copyright (c) 2016 Zmicier. All rights reserved.
//

import Foundation

class CurrencyConverter {

    //TODO use proper converter
    static func format(price: Int) -> String {
        return String(format: "€%.2f", Double(price) / 100.0)
    }
}
