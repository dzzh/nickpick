//
//  ProductService.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import Foundation
import Moya
import ReactiveSwift
import UIKit.UIImage

enum ProductService {
    case list
    case details(id: Int)
}

extension ProductService: TargetType {
    // TODO resolve URL dynamically to be able e.g. to switch to staging environment
    var baseURL: URL { return URL(string: "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart")! }

    var path: String {
        switch self {
            case .list:
                return "/list"
            case .details(let id):
                return "/\(id)/detail"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var parameters: [String: Any]? {
        return nil
    }

    //TODO implement
    var sampleData: Data {
        switch self {
            case .list:
                return "{}".utf8EncodedData
            case .details:
                return "{}".utf8EncodedData
        }
    }

    var task: Task {
        return .request
    }
}

private extension String {
    var utf8EncodedData: Data {
        return self.data(using: .utf8)!
    }
}
