//
//  AssetManager.swift
//  albelliTest
//
//  Created by Farhan Mirza on 07/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit
import Photos


typealias ResponseHandler<T> = (T) -> Void
typealias ErrorHandler = (Error) -> Void


protocol AssetManagerProtocol {
  func fetchImagesList(_ responseHandler:@escaping ResponseHandler<[PHAsset]>,_ errorHandler:@escaping ErrorHandler)
}

class AssetManager : AssetManagerProtocol {
    
    static let shared = AssetManager()
    
    func fetchImagesList(_ responseHandler: @escaping ResponseHandler<[PHAsset]>, _ errorHandler: @escaping ErrorHandler) {
    PHPhotoLibrary.requestAuthorization { status in
        var imageAssets = [PHAsset]()
        guard case .authorized = status else { return }
        let assets = PHAsset.fetchAssets(with: .image, options: PHFetchOptions())
        
         assets.enumerateObjects({ (object, count, stop) in
            imageAssets.append(object)
          })
        
        responseHandler(imageAssets)
    }

    }
    
    // resize image function to handle large image files
     func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
        // this make sure its image file or not
        guard let image = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }


}
