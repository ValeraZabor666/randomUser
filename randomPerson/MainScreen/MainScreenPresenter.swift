//
//  MainScreenPresenter.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation

protocol MainScreenPresenterProtocol {
    var router: MainScreenRouterProtocol? { get set }
    var interactor: MainScreenInteractorProtocol? { get set }
    var view: MainScreenViewControllerProtocol? { get set }
    
    func getRandomUserData()
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    var router: MainScreenRouterProtocol?
    var interactor: MainScreenInteractorProtocol?
    var view: MainScreenViewControllerProtocol?
    
    func getRandomUserData() {
        interactor?.fetchUserData()
    }
}
