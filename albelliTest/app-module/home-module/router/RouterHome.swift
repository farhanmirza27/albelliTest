//
//  RouterHome.swift
//  albelliTest
//
//  Created by Farhan Mirza on 07/02/2020.
//  Copyright © 2020 albelli BV. All rights reserved.
//

import UIKit

class HomeRouter : PresenterToRouterHomeProtocol {
    
    
    static func createModule() -> MainViewController {
        let view =  MainViewController()
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        let interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
        let router:PresenterToRouterHomeProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
        
    }
    
    func showDetailView(imageId : String ,navigationController: UINavigationController) {
        let detailsModule  = DetailsRouter.createModule(imageId: imageId)
        navigationController.pushViewController(detailsModule, animated: true)
    }
    
}
