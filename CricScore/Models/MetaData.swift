// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let teamDetails = try? newJSONDecoder().decode(TeamDetails.self, from: jsonData)

import Foundation

// MARK: - MetaData
struct MetaData: Codable {
    let matchdetail: Matchdetail?
    let nuggets: [String]?
//    let innings: [Inning]?
    let teams: [String: Team]?
    let notes: [String: [String]]?

    enum CodingKeys: String, CodingKey {
        case matchdetail = "Matchdetail"
        case nuggets = "Nuggets"
//        case innings = "Innings"
        case teams = "Teams"
        case notes = "Notes"
    }
}
