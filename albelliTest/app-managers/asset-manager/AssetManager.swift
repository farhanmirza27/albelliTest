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
    // fetch images list
    func fetchImagesList(_ responseHandler:@escaping ResponseHandler<[PHAsset]>,_ errorHandler:@escaping ErrorHandler)
}

// Asset Manager class to handle fetching assets
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
    
}
