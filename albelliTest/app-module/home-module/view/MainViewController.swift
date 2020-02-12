//
//  ViewController.swift
//  albelliTest
//
//  Created by Alex Yaroshyn on 08/01/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit
import Photos

class MainViewController: UIViewController {
    
    private let cellReuseIdentifier = "cell"
    
    private var collectionView: UICollectionView!
    
    private var photos = [PHAsset]()
    
    var presenter: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Intiallize Collection view
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: {
                let layout = UICollectionViewFlowLayout()
                layout.minimumInteritemSpacing = 0
                layout.minimumLineSpacing = 0
                return layout
        }()
        )
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register cell class
        collectionView.register(CollectionViewImageCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        view.addSubview(collectionView)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getAllPhotos()
    }
    
    private func getAllPhotos() {
        presenter?.requestPhotos()
    }
}



extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier,
            for: indexPath
            ) as! CollectionViewImageCell
        
        
       // images passed with PHImageManager
        PHImageManager.default().requestImage(for:  photos[indexPath.row], targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: nil) {  image, info in
               guard let info = info else { return }
               let isDegradedImage = info["PHImageResultIsDegradedKey"] as! Bool
               if !isDegradedImage {
                   if let image = image {
                    cell.image = image
                   }
               }
           }
        return cell

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width / 2, height: view.bounds.size.width / 2)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = photos[indexPath.item]
        asset.requestContentEditingInput(with: PHContentEditingInputRequestOptions()) { (input, _) in
            if  let url = input?.fullSizeImageURL {
                self.presenter?.showDetailView(imageId: url.path, navigationController: self.navigationController!)
            }
        }
    }
}


extension MainViewController : PresenterToViewHomeProtocol {
    func displayPictures(photos: [PHAsset]) {
        // reload collection view
        self.photos = photos
        DispatchQueue.main.async { self.collectionView.reloadData() }
    }
    
    func showError() {
        // handel error if any comes up
        self.alert(message: "something went wrong.")
    }
}
