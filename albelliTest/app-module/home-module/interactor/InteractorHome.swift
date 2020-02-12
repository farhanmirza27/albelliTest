//
//  InteractorHome.swift
//  albelliTest
//
//  Created by Farhan Mirza on 07/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol?
    
    func requestPhotosList() {
        
        AssetManager.shared.fetchImagesList({ result in
            //
            self.presenter?.fetchPicturesSuccess(photos: result)
        }) { error in
            print(error.localizedDescription)
            self.presenter?.fetchPicturesListFailed()
        }
        
    }
    
}

