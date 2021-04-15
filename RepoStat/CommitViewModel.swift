//
//  CommitViewModel.swift
//  RepoStat
//
//  Created by Vaibhav Nandam on 4/15/21.
//

import Foundation

protocol FinishedFetching: class {
    func fetchSuccess(_ commitDetails: [CommitDetail])
    func fetchFailed(_ error: String)
}
struct CommitViewModel {
    
    typealias ViewController = CommitTableViewController & FinishedFetching
    weak var viewController: ViewController?
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    let url = URL(string: "https://api.github.com/repos/nandamhere/RepoStat/commts")
    
    func fetchCommits() {
        if let url = url {
            let request = URLRequest(url: url)
            let task = URLSession(configuration: .default).dataTask(with: request) { (data, urlResponse, error) in
                self.handleData(data: data, urlResponse: urlResponse, error: error)
            }
            task.resume()
        }
        
    }
    
    func handleData(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if error != nil {
            print(error as Any)
            viewController?.fetchFailed("Failed to fetch")
            return
        }
        
        if let data = data {
            let response = String(data: data, encoding: .utf8)
            print(response as Any)
            let decoder = JSONDecoder()
            do {
                let decodedJsonData = try decoder.decode([CommitDetail].self, from: data)
                viewController?.fetchSuccess(decodedJsonData)
            } catch {
                viewController?.fetchFailed("Decoding Failed")
            }
            
        }
    }
}
