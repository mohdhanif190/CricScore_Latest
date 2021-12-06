//
//  Batting.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 29/11/21.
//

import Foundation


// MARK: - Batting

struct Batting: Codable {
    let style: Style?
    let average, strikerate, runs: String?

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case strikerate = "Strikerate"
        case runs = "Runs"
    }
}

enum Style: String, Codable {
    case lhb = "LHB"
    case rhb = "RHB"
}



//struct Batting: Codable {
//    let style: Style
//    let average, strikerate, runs: String
//
//    enum CodingKeys: String, CodingKey {
//        case style = "Style"
//        case average = "Average"
//        case strikerate = "Strikerate"
//        case runs = "Runs"
//    }
//}
//
//enum Style: String, Codable {
//    case lhb = "LHB"
//    case rhb = "RHB"
//}
