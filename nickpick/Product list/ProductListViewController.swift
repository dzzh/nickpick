//
//  ProductListViewController.swift
//  nickpick
//
//  Created by Zmicier Zaleznicenka on 23/11/16.
//  Copyright © 2016 Zmicier. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var viewModel: ProductListViewModel?

    // MARK: UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ProductListViewModel(productService: ProductService())
        viewModel!.updateProducts()

        configureCollectionView()
        configureAppearance()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if segue.identifier == "ProductDescriptionSegue" {
            let descriptionController = segue.destination as! ProductDescriptionViewController
            if let product = sender as? Product {
                let vm = ProductDescriptionViewModel(product: product)
                descriptionController.viewModel = vm
            }
        }
    }


    // MARK: Private (Collection view helpers)

    private func configureCollectionView() {
        let layout = collectionView.collectionViewLayout as! ProductListCollectionViewFlowLayout
        layout.configure()

        collectionView.delegate = self
        collectionView.dataSource = viewModel

        let productCellNib = UINib(nibName: "ProductListCollectionViewCell", bundle: nil)
        collectionView.register(productCellNib, forCellWithReuseIdentifier: productListCellId)
    }

    // MARK: Private (Appearance)

    private func configureAppearance() {
        self.title = "Product list" // TODO localization
    }

}

extension ProductListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if let product = viewModel!.product(id: indexPath.row) {
            performSegue(withIdentifier: "ProductDescriptionSegue", sender: product)
        }
    }
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout {

}
