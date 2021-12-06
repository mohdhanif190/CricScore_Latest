//
//  Matchdetail.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 01/12/21.
//

import Foundation

// MARK: - Matchdetail
struct Matchdetail: Codable {
    let teamHome, teamAway: String?
    let match: Match?
    let series: Series?
    let venue: Venue?
    let officials: Officials?
    let weather, tosswonby, status, statusID: String?
    let playerMatch, result, winningteam, winmargin: String?
    let equation: String?

    enum CodingKeys: String, CodingKey {
        case teamHome = "Team_Home"
        case teamAway = "Team_Away"
        case match = "Match"
        case series = "Series"
        case venue = "Venue"
        case officials = "Officials"
        case weather = "Weather"
        case tosswonby = "Tosswonby"
        case status = "Status"
        case statusID = "Status_Id"
        case playerMatch = "Player_Match"
        case result = "Result"
        case winningteam = "Winningteam"
        case winmargin = "Winmargin"
        case equation = "Equation"
    }
}
