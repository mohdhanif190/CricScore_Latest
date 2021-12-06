//
//  Config.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 02/12/21.
//

import Foundation
import UIKit

class Config {
    
    static let shared = Config()
    
    var strings: StaticStrings = StaticStrings()
    var integers: StaticInts = StaticInts()
    var preferences: PreferenceKey = PreferenceKey()
    
}

class StaticInts{
    let statusCodeCreated = 201
    let statusCodeUpdated = 204
    let statusCodeSuccess = 200
    let statusCodeBadRequest = 400
}


class PreferenceKey{
    
    let TEAM_1_SQUAD_A_FULL_NAME : String = "TEAM_1_SQUAD_A_FULL_NAME"
    let TEAM_1_SQUAD_A_SHORT_NAME : String = "TEAM_1_SQUAD_A_SHORT_NAME"
    let TEAM_1_SQUAD_B_FULL_NAME : String = "TEAM_1_SQUAD_B_FULL_NAME"
    let TEAM_1_SQUAD_B_SHORT_NAME : String = "TEAM_1_SQUAD_B_SHORT_NAME"
    let TEAM_1_SQUAD_A_TEAM_AWAY : String = "TEAM_1_SQUAD_A_TEAM_AWAY"
    let TEAM_1_SQUAD_B_TEAM_HOME : String = "TEAM_1_SQUAD_B_TEAM_HOME"
    let TEAM_1_WINNING_SQUAD : String = "TEAM_1_WINNING_SQUAD"
    let TEAM_1_TOSS_WON : String = "TEAM_1_TOSS_WON"
    let urlString_1 : String = "urlString_1"
    let TEAM_1_LINK_ACTIVE : String = "TEAM_1_LINK_ACTIVE"
    
    let TEAM_2_SQUAD_A_FULL_NAME : String = "TEAM_2_SQUAD_A_FULL_NAME"
    let TEAM_2_SQUAD_A_SHORT_NAME : String = "TEAM_2_SQUAD_A_SHORT_NAME"
    let TEAM_2_SQUAD_B_FULL_NAME : String = "TEAM_2_SQUAD_B_FULL_NAME"
    let TEAM_2_SQUAD_B_SHORT_NAME : String = "TEAM_2_SQUAD_B_SHORT_NAME"
    let TEAM_2_SQUAD_A_TEAM_AWAY : String = "TEAM_2_SQUAD_A_TEAM_AWAY"
    let TEAM_2_SQUAD_B_TEAM_HOME : String = "TEAM_2_SQUAD_B_TEAM_HOME"
    let TEAM_2_WINNING_SQUAD : String = "TEAM_2_WINNING_SQUAD"
    let TEAM_2_TOSS_WON : String = "TEAM_2_TOSS_WON"
    let urlString_2 : String = "urlString_2"
    let TEAM_2_LINK_ACTIVE : String = "TEAM_2_LINK_ACTIVE"
    let NUGGETS : String = "NUGGETS"
    
}

class StaticStrings{
    
    let noInternetConnectionMsg = "Make sure your device is connected to the internet."
    let serverErrorMsg = "We're sorry, but something went wrong. Please try again."

}


enum HTTPHeaderField: String {
    case authentication  = "Authorization"
    case contentType     = "Content-Type"
    case acceptType      = "Accept"
    case acceptEncoding  = "Accept-Encoding"
    case acceptLangauge  = "Accept-Language"
//    case token = "Token"
}

enum ContentType: String {
    case json            = "application/json"
    case multipart       = "multipart/form-data"
    case multipartBoundary = "multipart/form-data; boundary="
    case ENUS            = "en-us"
    case urlEncoded        = "application/x-www-form-urlencoded"
}
