//
//  ProductListCollectionViewFlowLayout.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import UIKit

class ProductListCollectionViewFlowLayout: UICollectionViewFlowLayout {

    let cellMargin: CGFloat = 5.0
    let imagePadding: CGFloat = 5.0
    let labelDistance: CGFloat = 10.0
    let titleHeight: CGFloat = 38.0
    let priceHeight: CGFloat = 29.0

    var cellSize: CGSize { get {
        let screenWidth = UIScreen.main.bounds.size.width
        let width: CGFloat = (screenWidth - 3 * cellMargin) / 3
        let height: CGFloat = width - imagePadding + labelDistance + titleHeight +
                labelDistance + priceHeight + labelDistance
        return CGSize(width: width, height: height)
    }}

    func configure() {
        minimumLineSpacing = cellMargin
        minimumInteritemSpacing = cellMargin
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        itemSize = cellSize
        estimatedItemSize = cellSize
    }

}
