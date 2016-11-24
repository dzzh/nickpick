//
// Created by Zmicier Zaleznicenka on 24/11/16.
// Copyright (c) 2016 Zmicier. All rights reserved.
//

import XCTest

class FoundationExtensionsTests: XCTestCase {

    func testPriceInEuroCents() {
        XCTAssertEqual("€0.00", Int(0).asPriceInEuroCents())
        XCTAssertEqual("€0.08", Int(8).asPriceInEuroCents())
        XCTAssertEqual("€0.70", Int(70).asPriceInEuroCents())
        XCTAssertEqual("€1.19", Int(119).asPriceInEuroCents())
        XCTAssertEqual("€1,000.00", Int(100000).asPriceInEuroCents())
    }

}
