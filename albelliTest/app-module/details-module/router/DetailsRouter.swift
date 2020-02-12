//
//  DetailsRouter.swift
//  albelliTest
//
//  Created by Farhan Mirza on 11/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit

class DetailsRouter : PresenterToRouterDetailsProtocol {
    
    static func createModule(imageId : String) -> ImageViewController {
        let view =  ImageViewController(imageId: imageId)
        let presenter: ViewToPresenterDetailsProtocol & InteractorToPresenterDetailsProtocol = DetailsPresenter()
        let interactor: PresenterToInteractorDetailsProtocol = DetailsInteractor()
        let router:PresenterToRouterDetailsProtocol = DetailsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
        
    }
    
    func navigateToHomeView(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
    
    
    
    
}
