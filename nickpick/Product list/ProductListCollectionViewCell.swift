//
//  ProductListCollectionViewCell.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import Kingfisher
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
        if let url = product.imageUrl {
            let placeholder = UIImage(named: "empty_product")
            image.kf.setImage(with: url, placeholder: placeholder,
                    options: [.transition(.fade(0.2))])
        }
        title.text = product.name
        price.text = product.priceInCents.asPriceInEuroCents()
    }

    // MARK: Private (Helpers)

    private func configureInitialAppearance() {
        image.image = UIImage(named: "empty_product")
        title.text = "loading"
        price.text = ""
    }
}
