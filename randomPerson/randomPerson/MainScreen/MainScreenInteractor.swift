//
//  MainScreenInteractor.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation

protocol MainScreenInteractorProtocol {
    var presenter: MainScreenPresenterProtocol? { get set }

    func fetchUserData()
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
                print("*** \(response?.results[0].gender) ***")
//                print("*** \(response?.info.seed) ***")
//                self.presenter?.uploadData(data: response!) upload data
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
