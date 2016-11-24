//
// Created by Zmicier Zaleznicenka on 24/11/16.
// Copyright (c) 2016 Zmicier. All rights reserved.
//

import Foundation

extension Int {

    func asPriceInEuroCents() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        return formatter.string(from: NSNumber(value: Double(self) / 100.0))!
    }
}
