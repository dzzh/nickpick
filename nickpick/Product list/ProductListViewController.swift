//
//  ProductListViewController.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    // MARK: UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }

    // MARK: Private (appearance)

    private func configureAppearance() {
        self.title = "Product list" // TODO localization
    }

}
