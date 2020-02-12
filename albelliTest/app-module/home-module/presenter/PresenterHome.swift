//
//  PresenterHome.swift
//  albelliTest
//
//  Created by Farhan Mirza on 07/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//


import UIKit
import Photos

// handle functions by View
class  HomePresenter  : ViewToPresenterHomeProtocol {

    var view: PresenterToViewHomeProtocol?
    
    var interactor: PresenterToInteractorHomeProtocol?
    
    var router: PresenterToRouterHomeProtocol?
    
    func requestPhotos() {
        interactor?.requestPhotosList()
    }
    
    func showDetailView(imageId: String, navigationController: UINavigationController) {
        router?.showDetailView(imageId : imageId, navigationController : navigationController)
    }
    
}

// handle functions by Interactor
extension HomePresenter : InteractorToPresenterHomeProtocol {
    func fetchPicturesSuccess(photos : [PHAsset]) {
        view?.displayPictures(photos: photos)
    }
    
    func fetchPicturesListFailed() {
        view?.showError()
    }
    
 
}
