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
        price.text = formattedPrice(from: product.priceInCents)
    }

    // MARK: Private (Helpers)

    private func configureInitialAppearance() {
        image.image = UIImage(named: "empty_product")
        title.text = "loading"
        price.text = ""
    }

    // TODO helper class for currency conversion and localization
    private func formattedPrice(from priceInCents: Int) -> String {
        return String(format: "€%.2f", Double(priceInCents) / 100.0)
    }
}
