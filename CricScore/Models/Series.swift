//
//  Series.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 01/12/21.
//

import Foundation

// MARK: - Series
struct Series: Codable {
    let id, name, status, tour: String?
    let tourName: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case status = "Status"
        case tour = "Tour"
        case tourName = "Tour_Name"
    }
}
