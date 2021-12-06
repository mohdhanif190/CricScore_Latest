//
//  Venue.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 01/12/21.
//

import Foundation

// MARK: - Venue
struct Venue: Codable {
    let id, name: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}
