//
//  Product.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit.UIImage

struct Product {
    let id: Int
    let name: String
    let description: String
    let imageUrl: String
    let priceInCents: Int
}

extension Product {
    static func from(json: JSON) -> Product? {
        if let idString = json["product_id"].string,
           let id = Int(idString),
           let name = json["name"].string,
           let price = json["price"].int,
           let imageUrl = json["image"].string {

            let description = json["description"].stringValue
            return Product(id: id, name: name, description: description, imageUrl: imageUrl, priceInCents: price)
        } else {
            return nil
        }
    }
}
