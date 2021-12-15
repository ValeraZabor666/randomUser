//
//  MainScreenInteractor.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation
import UIKit

protocol MainScreenInteractorProtocol {
    var presenter: MainScreenPresenterProtocol? { get set }

    func fetchUserData()
    func fetchImage(url: String)
}

class MainScreenInteractor: MainScreenInteractorProtocol {
    
    
    var presenter: MainScreenPresenterProtocol?
    
    func fetchUserData() {
        let urlString = "https://randomuser.me/api/"
        let url = URL(string: urlString)
        let decoder = JSONDecoder()

        getJSON(url: url!) { (data, error) in
            
            let response = try? decoder.decode(ResponseAPI.self, from: data!)
            if response != nil {
                self.presenter?.setRandomUserData(data: response!.results[0])
            }
            else {
                print("nil")
//                self.presenter?.uploadDataWithStorage() error
            }
        }
    }
    
    func fetchImage(url: String) {
        let url = URL(string: url)

        getJSON(url: url!) { (data, error) in
            
            if data != nil {
                self.presenter?.setImage(image: UIImage(data: data!)!)
            }
            else {
                print("nil")
//                self.presenter?.uploadDataWithStorage() error
            }
        }

    }
    
    private func getJSON(url: URL, completion: @escaping (Data?, Error?) -> Void) {

        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {

        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
}
