//
// Created by Zmicier Zaleznicenka on 24/11/16.
// Copyright (c) 2016 Zmicier. All rights reserved.
//

import Foundation
import SwiftyJSON
import XCTest

class ProductTests: XCTestCase {

    // MARK: Tests

    func testCreateProductFromValidShortJson() {
        let jsonData = json(from: validData(short: true))

        if let product = Product.from(json: jsonData) {
            XCTAssertEqual(1, product.id)
            XCTAssertEqual("Apples", product.name)
            XCTAssertEqual(120, product.priceInCents)
            XCTAssertEqual("https://s3-eu-west-1.amazonaws.com/developer-application-test/images/1.jpg", product.imageUrlString)
            XCTAssertEqual("", product.description)
        } else {
            XCTFail("Empty product")
        }
    }

    func testCreateProductFromValidLongJson() {
        let jsonData = json(from: validData(short: false))

        if let product = Product.from(json: jsonData) {
            XCTAssertEqual(1, product.id)
            XCTAssertEqual("Apples", product.name)
            XCTAssertEqual(120, product.priceInCents)
            XCTAssertEqual("https://s3-eu-west-1.amazonaws.com/developer-application-test/images/1.jpg", product.imageUrlString)
            XCTAssertEqual("An apple a day keeps the doctor away.", product.description)
        } else {
            XCTFail("Empty product")
        }
    }

    func testCreateProductFromInvalidJson() {
        let jsonData = json(from: invalidData())

        let product = Product.from(json: jsonData)

        XCTAssertNil(product)
    }

    // MARK: Helpers

    func validData(short: Bool) -> String {
        var result =
            "{ " +
            "\"product_id\" : \"1\", " +
            "\"name\" : \"Apples\", " +
            "\"price\" : 120, " +
            "\"image\" : \"https://s3-eu-west-1.amazonaws.com/developer-application-test/images/1.jpg\""

        if !short {
            result += ", \"description\" : \"An apple a day keeps the doctor away.\" "
        }

        result += "}"
        return result
    }

    func invalidData() -> String {

        // price is missing
        return
            "{ " +
            "\"product_id\" : \"1\", " +
            "\"name\" : \"Apples\", " +
            "\"image\" : \"https://s3-eu-west-1.amazonaws.com/developer-application-test/images/1.jpg\", "
            "\"description\" : \"An apple a day keeps the doctor away.\", "
            "}"
    }


    func json(from string: String) -> JSON {
        guard let dataFromString = string.data(using: .utf8) else { return nil }
        return JSON(data: dataFromString)
    }
}
