//
//  MainScreenRouter.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation
import UIKit

typealias EntryPoint = MainScreenViewControllerProtocol & UIViewController

protocol MainScreenRouterProtocol {
    
    var entry: EntryPoint? { get }
    static func start() -> MainScreenRouterProtocol
    
}

class MainScreenRouter: MainScreenRouterProtocol {
    
    var entry: EntryPoint?
    
    static func start() -> MainScreenRouterProtocol {
        let router = MainScreenRouter()
        
        var view: MainScreenViewControllerProtocol = MainScreenViewController()
        var presenter: MainScreenPresenterProtocol = MainScreenPresenter()
        var interactor: MainScreenInteractorProtocol = MainScreenInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
