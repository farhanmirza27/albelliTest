//
//  protocols.swift
//  albelliTest
//
//  Created by Farhan Mirza on 07/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit
import Photos

// List of protocols for home app module

protocol ViewToPresenterHomeProtocol: class{
    var view: PresenterToViewHomeProtocol? {get set}
    var interactor: PresenterToInteractorHomeProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    func requestPhotos()
    func showDetailView(imageId : String , navigationController : UINavigationController)
    
}

protocol PresenterToViewHomeProtocol: class {
    func displayPictures(photos : [PHAsset])
    func showError()
}

protocol PresenterToRouterHomeProtocol: class {
    static func createModule()-> MainViewController
    func showDetailView(imageId : String , navigationController : UINavigationController)
}

protocol PresenterToInteractorHomeProtocol: class {
    var presenter:InteractorToPresenterHomeProtocol? {get set}
    func requestPhotosList()
}

protocol InteractorToPresenterHomeProtocol: class {
    func fetchPicturesSuccess(photos : [PHAsset])
    func fetchPicturesListFailed()
}
