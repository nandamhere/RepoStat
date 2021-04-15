//
//  ViewController.swift
//  RepoStat
//
//  Created by Vaibhav Nandam on 4/14/21.
//

import UIKit
import NotificationBannerSwift

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
    
    func fetchFailed(_ error: String) {
        DispatchQueue.main.async {
            let banner = NotificationBanner(attributedTitle: NSAttributedString(string: error))
            banner.show()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Commit History"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commitDetailsCell", for: indexPath) as? CommitDetailsTableViewCell
        
        cell?.author.text = "Author: \(commitDetails[indexPath.row].commit.author.name)"
        cell?.commitHash.text = "CommithashKey: \(commitDetails[indexPath.row].commitHash)"
        cell?.message.text = "CommitMessage: \(commitDetails[indexPath.row].commit.message)"
        
        return cell ?? UITableViewCell()
    }
}
