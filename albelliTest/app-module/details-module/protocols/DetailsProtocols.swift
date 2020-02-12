//
//  DetailsProtocols.swift
//  albelliTest
//
//  Created by Farhan Mirza on 11/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit
import Photos

protocol ViewToPresenterDetailsProtocol: class{
    var view: PresenterToViewDetailsProtocol? {get set}
    var interactor: PresenterToInteractorDetailsProtocol? {get set}
    var router: PresenterToRouterDetailsProtocol? {get set}
    func navigateToHomeView(navigationController : UINavigationController)
}


protocol PresenterToViewDetailsProtocol: class {
     func showError()
}

protocol PresenterToRouterDetailsProtocol: class {
    static func createModule(imageId : String)-> ImageViewController
    func navigateToHomeView(navigationController : UINavigationController)
}

protocol PresenterToInteractorDetailsProtocol: class {
    var presenter:InteractorToPresenterDetailsProtocol? {get set}
    //
}

protocol InteractorToPresenterDetailsProtocol: class {
   //
}
