//
//  Bowling.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 29/11/21.
//

import Foundation

// MARK: - Bowling

struct Bowling: Codable {
    let style, average, economyrate, wickets: String?

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case economyrate = "Economyrate"
        case wickets = "Wickets"
    }
}


//struct Bowling: Codable {
//    let style, average, economyrate, wickets: String
//
//    enum CodingKeys: String, CodingKey {
//        case style = "Style"
//        case average = "Average"
//        case economyrate = "Economyrate"
//        case wickets = "Wickets"
//    }
//}
