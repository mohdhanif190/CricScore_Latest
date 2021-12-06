//
//  Officials.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 01/12/21.
//

import Foundation

// MARK: - Officials
struct Officials: Codable {
    let umpires, referee: String?

    enum CodingKeys: String, CodingKey {
        case umpires = "Umpires"
        case referee = "Referee"
    }
}
