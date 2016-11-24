//
//  ProductDescriptionViewController.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import enum Result.NoError

import ReactiveSwift
import UIKit


//TODO custom back button
//TODO multiline title
//TODO set text view offset to 0 when loading, keep it when changing orientation
class ProductDescriptionViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var viewModel: ProductDescriptionViewModel?

    // MARK: UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitialContents()
        bindViewModel()
    }

    // MARK: Private (Helpers)

    private func setInitialContents() {
        image.image = UIImage(named: "empty_product")
        titleLabel.text = "n/a"
        priceLabel.text = ""
        descriptionText.text = ""
    }

    private func bindViewModel() {
        guard let viewModel = viewModel else { return }

        viewModel.product.producer
                 .startWithValues { product in
            self.title = product.name
            self.titleLabel.text = product.name
            self.priceLabel.text = CurrencyConverter.format(price: product.priceInCents)
            self.descriptionText.text = product.description
        }
    }

}
