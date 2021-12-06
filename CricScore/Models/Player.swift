//
//  Player.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 29/11/21.
//

import Foundation


// MARK: - Player

struct Player: Codable {
    let position, nameFull: String?
    let batting: Batting?
    let bowling: Bowling?
    let iscaptain, iskeeper: Bool?

    enum CodingKeys: String, CodingKey {
        case position = "Position"
        case nameFull = "Name_Full"
        case batting = "Batting"
        case bowling = "Bowling"
        case iscaptain = "Iscaptain"
        case iskeeper = "Iskeeper"
    }
}

//struct Player: Codable {
//    let position, nameFull: String
//    let batting: Batting
//    let bowling: Bowling
//    let iscaptain, iskeeper: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case position = "Position"
//        case nameFull = "Name_Full"
//        case batting = "Batting"
//        case bowling = "Bowling"
//        case iscaptain = "Iscaptain"
//        case iskeeper = "Iskeeper"
//    }
//}
