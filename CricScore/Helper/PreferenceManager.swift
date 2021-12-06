//
//  PreferenceManager.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 02/12/21.
//

import Foundation
import UIKit


class PreferenceManager {
    

    static let shared = PreferenceManager()
    let preferences = UserDefaults.standard
    
    private init() { }
    
    enum Keys{
        case TEAM_1_SQUAD_A_FULL_NAME
        case TEAM_1_SQUAD_B_FULL_NAME
        case TEAM_1_SQUAD_A_SHORT_NAME
        case TEAM_1_SQUAD_B_SHORT_NAME
        case TEAM_1_SQUAD_A_TEAM_AWAY
        case TEAM_1_SQUAD_B_TEAM_HOME
        case TEAM_1_WINNING_SQUAD
        case TEAM_1_TOSS_WON
        case urlString_1
        case TEAM_1_LINK_ACTIVE
        
        case TEAM_2_SQUAD_A_FULL_NAME
        case TEAM_2_SQUAD_B_FULL_NAME
        case TEAM_2_SQUAD_A_SHORT_NAME
        case TEAM_2_SQUAD_B_SHORT_NAME
        case TEAM_2_SQUAD_A_TEAM_AWAY
        case TEAM_2_SQUAD_B_TEAM_HOME
        case TEAM_2_WINNING_SQUAD
        case TEAM_2_TOSS_WON
        case urlString_2
        case TEAM_2_LINK_ACTIVE
        case NUGGETS

        
        var key: String{
            switch self {
            case .TEAM_1_SQUAD_A_FULL_NAME:
                return Config.shared.preferences.TEAM_1_SQUAD_A_FULL_NAME
            case .TEAM_1_SQUAD_B_FULL_NAME:
                return Config.shared.preferences.TEAM_1_SQUAD_B_FULL_NAME
            case .TEAM_1_SQUAD_A_SHORT_NAME:
                return Config.shared.preferences.TEAM_1_SQUAD_A_SHORT_NAME
            case .TEAM_1_SQUAD_B_SHORT_NAME:
                return Config.shared.preferences.TEAM_1_SQUAD_B_SHORT_NAME
            case .TEAM_1_SQUAD_A_TEAM_AWAY:
                return Config.shared.preferences.TEAM_1_SQUAD_A_TEAM_AWAY
            case .TEAM_1_SQUAD_B_TEAM_HOME:
                return Config.shared.preferences.TEAM_1_SQUAD_B_TEAM_HOME
            case .TEAM_1_WINNING_SQUAD:
                return Config.shared.preferences.TEAM_1_WINNING_SQUAD
            case .TEAM_1_TOSS_WON:
                return Config.shared.preferences.TEAM_1_TOSS_WON
                            
            case .TEAM_2_SQUAD_A_FULL_NAME:
                return Config.shared.preferences.TEAM_2_SQUAD_A_FULL_NAME
            case .TEAM_2_SQUAD_B_FULL_NAME:
                return Config.shared.preferences.TEAM_2_SQUAD_B_FULL_NAME
            case .TEAM_2_SQUAD_A_SHORT_NAME:
                return Config.shared.preferences.TEAM_2_SQUAD_A_SHORT_NAME
            case .TEAM_2_SQUAD_B_SHORT_NAME:
                return Config.shared.preferences.TEAM_2_SQUAD_B_SHORT_NAME
            case .TEAM_2_SQUAD_A_TEAM_AWAY:
                return Config.shared.preferences.TEAM_2_SQUAD_A_TEAM_AWAY
            case .TEAM_2_SQUAD_B_TEAM_HOME:
                return Config.shared.preferences.TEAM_2_SQUAD_B_TEAM_HOME
            case .TEAM_2_WINNING_SQUAD:
                return Config.shared.preferences.TEAM_2_WINNING_SQUAD
            case .TEAM_2_TOSS_WON:
                return Config.shared.preferences.TEAM_2_TOSS_WON
            
            case .urlString_1:
                return Config.shared.preferences.urlString_1
            case .urlString_2:
                return Config.shared.preferences.urlString_2
            case .TEAM_1_LINK_ACTIVE:
                return Config.shared.preferences.TEAM_1_LINK_ACTIVE
            case .TEAM_2_LINK_ACTIVE:
                return Config.shared.preferences.TEAM_2_LINK_ACTIVE
            case .NUGGETS:
                return Config.shared.preferences.NUGGETS
            }
        }
    }
   
    
    func writeDouble(key: Keys, value: Double) {
        preferences.set(value, forKey: key.key)
        preferences.synchronize()
    }
    
    func readDouble(key: Keys) -> Double  {
        return preferences.double(forKey: key.key)
    }
    
    func writeString(key: Keys, value: String) {
        preferences.set(value, forKey: key.key);
        preferences.synchronize()
    }
    
    func readString(key: Keys) -> String  {
        return preferences.string(forKey: key.key) ?? ""
    }
    
    func writeInt(key: Keys, value: Int) {
        preferences.set(value, forKey: key.key);
        preferences.synchronize()
    }
    
    func readInt(key: Keys) -> Int  {
        return preferences.integer(forKey: key.key)
    }
    
    func writeBoolean(key: Keys, value: Bool) {
        preferences.set(value, forKey: key.key);
        preferences.synchronize()
    }
    
    func readBoolean(key: Keys) -> Bool  {
        return preferences.bool(forKey: key.key)
    }
    
    func writeData(key: Keys, value: Data?) {
        preferences.set(value, forKey: key.key);
        preferences.synchronize()
    }
    
    func readData(key: Keys) -> Data? {
        return preferences.data(forKey: key.key) ?? nil
    }
    
    func writeAny(key: Keys, value: Any) {
        preferences.set(value, forKey: key.key)
        preferences.synchronize()
    }
    
    func readAny(key: Keys) -> Any  {
        return preferences.value(forKey: key.key) as Any
    }
    
    func resetDefaults() {
        let dictionary = preferences.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            preferences.removeObject(forKey: key)
        }
    }
}

