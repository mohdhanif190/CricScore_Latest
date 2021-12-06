//
//  PlayerDataModel.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 29/11/21.
//

import Foundation


// MARK: - Team

//struct Team: Codable {
//    let nameFull, nameShort: String
//    let players: [String: Player]
//
//    enum CodingKeys: String, CodingKey {
//        case nameFull = "Name_Full"
//        case nameShort = "Name_Short"
//        case players = "Players"
//    }
//}


struct Team: Codable {
    let nameFull, nameShort: String?
    let players: [String: Player]?

    enum CodingKeys: String, CodingKey {
        case nameFull = "Name_Full"
        case nameShort = "Name_Short"
        case players = "Players"
    }
}

struct Team1: Decodable {
    let nameFull, nameShort: String?
    let players: [String: Player]?

    enum CodingKeys: String, CodingKey {
        case nameFull = "Name_Full"
        case nameShort = "Name_Short"
        case players = "Players"
    }
}
