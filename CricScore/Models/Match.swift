//
//  Match.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 01/12/21.
//

import Foundation


// MARK: - Match
struct Match: Codable {
    let livecoverage, id, code, league: String?
    let number, type, date, time: String?
    let offset, daynight: String?

    enum CodingKeys: String, CodingKey {
        case livecoverage = "Livecoverage"
        case id = "Id"
        case code = "Code"
        case league = "League"
        case number = "Number"
        case type = "Type"
        case date = "Date"
        case time = "Time"
        case offset = "Offset"
        case daynight = "Daynight"
    }
}
