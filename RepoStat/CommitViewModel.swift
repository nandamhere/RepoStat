//
//  CommitViewModel.swift
//  RepoStat
//
//  Created by Vaibhav Nandam on 4/15/21.
//

import Foundation

protocol FinishedFetching: class {
    func fetchSuccess(_ commitDetails: [CommitDetail])
    func fetchFailed()
}
struct CommitViewModel {
    
    typealias ViewController = CommitTableViewController & FinishedFetching
    weak var viewController: ViewController?
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    let url = URL(string: "https://api.github.com/repos/nandamhere/RepoStat/commits")
    
    func fetchCommits() {
        if let url = url {
            var request = URLRequest(url: url)
            request.addValue("Bearer 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", forHTTPHeaderField: "Authorization")
            request.addValue("_octo=GH1.1.32422612.1618456475; logged_in=no", forHTTPHeaderField: "Cookie")
            request.httpMethod = "GET"
            
            let task = URLSession(configuration: .default).dataTask(with: request) { (data, urlResponse, error) in
                self.handleData(data: data, urlResponse: urlResponse, error: error)
            }
            task.resume()
        }
        
    }
    
    func handleData(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if error != nil {
            print(error as Any)
            viewController?.fetchFailed()
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
                print("Failed Decoding")
            }
            
        }
    }
}
