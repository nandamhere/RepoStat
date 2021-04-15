//
//  ViewController.swift
//  RepoStat
//
//  Created by Vaibhav Nandam on 4/14/21.
//

import UIKit

class CommitTableViewController: UITableViewController, FinishedFetching {
   
    private lazy var commitViewModel = CommitViewModel(viewController: self)
    var commitDetails: [CommitDetail] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        commitViewModel.fetchCommits()
    }
    
    func fetchSuccess(_ commitDetails: [CommitDetail]) {
        self.commitDetails = commitDetails
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchFailed() {
        let alert = UIAlertController(title: "Failed", message: "Failed to fetch Commits", preferredStyle: .alert)
        alert.present(self, animated: true, completion: nil)
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return commitDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // commitDetailsCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "commitDetailsCell", for: indexPath) as? CommitDetailsTableViewCell
        cell?.author.text = commitDetails[indexPath.row].commit.author.name
        cell?.commitHash.text = commitDetails[indexPath.row].commitHash
        cell?.message.text = commitDetails[indexPath.row].commit.message
        
        return cell ?? UITableViewCell()
    }
}

