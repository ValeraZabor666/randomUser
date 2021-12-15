//
//  MainScreenPresenter.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation
import UIKit

protocol MainScreenPresenterProtocol {
    var router: MainScreenRouterProtocol? { get set }
    var interactor: MainScreenInteractorProtocol? { get set }
    var view: MainScreenViewControllerProtocol? { get set }
    
    func getRandomUserData()
    func setRandomUserData(data: RandomUser)
    func getImage(url: String)
    func setImage(image: UIImage)
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    var router: MainScreenRouterProtocol?
    var interactor: MainScreenInteractorProtocol?
    var view: MainScreenViewControllerProtocol?
    
    func getRandomUserData() {
        interactor?.fetchUserData()
    }
    
    func setRandomUserData(data: RandomUser) {
        view?.updateUserData(data: data)
    }
    
    func getImage(url: String) {
        interactor?.fetchImage(url: url)
    }
    
    func setImage(image: UIImage) {
        view?.updateUserImage(photo: image)
    }
}
