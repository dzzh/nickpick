//
//  ProductListCollectionViewCell.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import UIKit

class ProductListCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!

    // MARK: Interface

    override func awakeFromNib() {
        super.awakeFromNib()
        configureInitialAppearance()
    }

    func update(with product: Product) {
//        image.image = product.image
        title.text = product.name
        price.text = CurrencyConverter.format(price: product.priceInCents)
    }

    // MARK: Private (Helpers)

    private func configureInitialAppearance() {
        image.image = UIImage(named: "empty_product")
        title.text = "loading"
        price.text = ""
    }
}
