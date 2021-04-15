//
//  Commit.swift
//  RepoStat
//
//  Created by Vaibhav Nandam on 4/15/21.
//

import Foundation

struct CommitDetail: Codable {
    let commitHash: String
    let commit: Commit
    
    struct Commit: Codable {
        let author: Author
        let message: String
        
        struct Author: Codable {
            let name: String
        }
    }
}

extension CommitDetail {
    enum CodingKeys: String, CodingKey {
        case commitHash = "sha"
        case commit
    }
}


