//
//  MainScreenView.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation
import UIKit

protocol MainScreenViewControllerProtocol {
    var presenter: MainScreenPresenterProtocol? { get set }
}

class MainScreenViewController: UIViewController, MainScreenViewControllerProtocol {
    
    var presenter: MainScreenPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomUser()
    }
    
    private func getRandomUser() {
        presenter?.getRandomUserData()
    }
}
