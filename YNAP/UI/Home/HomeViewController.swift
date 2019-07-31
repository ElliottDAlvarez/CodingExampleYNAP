//
//  HomeViewController.swift
//  YNAP
//
//  Created by Elliott D'Alvarez on 24/07/2019.
//  Copyright © 2019 EJD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private var collectionView: ClothingCollectionView!
    var clothingListViewModel: ClothingListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load and map the clothing
        let service = NetworkingService(baseURL: URL(string: Constants.Network.BaseURL)!)
        clothingListViewModel = ClothingListViewModel(service: service)
        loadClothing()
    }

    private func loadClothing() {
        clothingListViewModel?.get(completion: { [weak self] (model) in
            self?.collectionView?.models = model!.clothingViewModels
        })
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}

// MARK: CollectionView Delegate / DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionView.models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let model = self.collectionView.models[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as? HomeCollectionViewCell
        cell?.setup(model)

        return cell ?? UICollectionViewCell()
    }
}

// MARK: CollectionView FlowLayout Delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (self.collectionView.bounds.width - self.collectionView.cellSpacing) / 2.0

        return CGSize(width: width, height: width * 1.5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.collectionView.cellSpacing
    }
}
