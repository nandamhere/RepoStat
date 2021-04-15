//
//  ViewController.swift
//  RepoStat
//
//  Created by Vaibhav Nandam on 4/14/21.
//

import UIKit

class CommitTableViewController: UITableViewController {
    
    var commitDetails: [CommitDetail] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

