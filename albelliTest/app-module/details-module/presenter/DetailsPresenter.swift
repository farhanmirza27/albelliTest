//
//  DetailsPresenter.swift
//  albelliTest
//
//  Created by Farhan Mirza on 11/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//


import UIKit
import Photos

// handle functions by View
class  DetailsPresenter  : ViewToPresenterDetailsProtocol {
    var view: PresenterToViewDetailsProtocol?
    
    var interactor: PresenterToInteractorDetailsProtocol?
    
    var router: PresenterToRouterDetailsProtocol?
    
    func navigateToHomeView(navigationController : UINavigationController) {
        router?.navigateToHomeView(navigationController: navigationController)
    }
    
    
}

// handle functions by Interactor
extension DetailsPresenter : InteractorToPresenterDetailsProtocol {
    
}
