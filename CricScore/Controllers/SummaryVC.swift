//
//  SummaryVC.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 28/11/21.
//

import UIKit
import SwiftyJSON

class SummaryVC: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiCalling1()
        apiCalling2()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.separatorStyle = .none
        
        homeTableView.register(UINib(nibName: "HomeTableCell", bundle: nil), forCellReuseIdentifier: "homeCell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let loader = self.loader()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
}



extension SummaryVC {
    
    
    func apiCalling1() {
        
        let urlString = URL(string: "https://www.sportsadda.com/cricket/live/json/sapk01222019186652.json")
        
        URLSession.shared.dataTask(with: urlString!) { data, response, error in
            
            guard let data = data else { return }
            do{
                
                let json = try JSON(data: data)
                //                print(json)
                let results = json["Matchdetail"]
                //                print(results)
                
                let winningTeam = results["Winningteam"]
                PreferenceManager.shared.writeString(key: .TEAM_1_WINNING_SQUAD, value: winningTeam.stringValue)
                //                print("TEAM \(PreferenceManager.shared.readString(key: .WINNING_SQUAD)) WIN THE MATCH")
                
                let tossWon = results["Tosswonby"]
                PreferenceManager.shared.writeString(key: .TEAM_1_TOSS_WON, value: tossWon.stringValue)
                //                print("TEAM \(PreferenceManager.shared.readString(key: .TOSS_WON)) WIN THE TOSS")
                
                let name1 = results["Team_Away"]
                PreferenceManager.shared.writeString(key: .TEAM_1_SQUAD_A_TEAM_AWAY, value: name1.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_A_TEAM_AWAY)) IS TEAM AWAY")
                
                let name2 = results["Team_Home"]
                PreferenceManager.shared.writeString(key: .TEAM_1_SQUAD_B_TEAM_HOME, value: name2.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_B_TEAM_HOME)) IS TEAM HOME")
                
                let teamNames = json["Teams"]
                
                let TeamA = teamNames["6"]
                
                let teamAFullName = TeamA["Name_Full"]
                PreferenceManager.shared.writeString(key: .TEAM_1_SQUAD_A_FULL_NAME, value: teamAFullName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_A_FULL_NAME)) IS TEAM A")
                
                let teamAShortName = TeamA["Name_Short"]
                PreferenceManager.shared.writeString(key: .TEAM_1_SQUAD_A_SHORT_NAME, value: teamAShortName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_A_SHORT_NAME)) IS SHORT NAME FOR TEAM A")
                
                let TeamB = teamNames["7"]
                let teamBFullName = TeamB["Name_Full"]
                PreferenceManager.shared.writeString(key: .TEAM_1_SQUAD_B_FULL_NAME, value: teamBFullName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_B_FULL_NAME)) IS TEAM B")
                
                
                let teamBShortName = TeamB["Name_Short"]
                PreferenceManager.shared.writeString(key: .TEAM_1_SQUAD_B_SHORT_NAME, value: teamBShortName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_B_SHORT_NAME)) IS SHORT NAME FOR TEAM B")
                
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func apiCalling2() {
        
        let urlString = URL(string: "https://www.sportsadda.com/cricket/live/json/nzin01312019187360.json")
        
        URLSession.shared.dataTask(with: urlString!) { data, response, error in
            
            guard let data = data else { return }
            do{
                
                let json = try JSON(data: data)
                //                print(json)
                let results = json["Matchdetail"]
//                print(results)
                
                let winningTeam = results["Winningteam"]
                PreferenceManager.shared.writeString(key: .TEAM_2_WINNING_SQUAD, value: winningTeam.stringValue)
//                print("TEAM \(PreferenceManager.shared.readString(key: .TEAM_2_WINNING_SQUAD)) WIN THE MATCH")
                
                let tossWon = results["Tosswonby"]
                PreferenceManager.shared.writeString(key: .TEAM_2_TOSS_WON, value: tossWon.stringValue)
//                print("TEAM \(PreferenceManager.shared.readString(key: .TEAM_2_TOSS_WON)) WIN THE TOSS")
                
                let name1 = results["Team_Away"]
                PreferenceManager.shared.writeString(key: .TEAM_2_SQUAD_A_TEAM_AWAY, value: name1.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_A_TEAM_AWAY)) IS TEAM AWAY")
                
                let name2 = results["Team_Home"]
                PreferenceManager.shared.writeString(key: .TEAM_2_SQUAD_B_TEAM_HOME, value: name2.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_B_TEAM_HOME)) IS TEAM HOME")
                
                let teamNames = json["Teams"]
                
                let TeamA = teamNames["4"]
                
                let teamAFullName = TeamA["Name_Full"]
                PreferenceManager.shared.writeString(key: .TEAM_2_SQUAD_A_FULL_NAME, value: teamAFullName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_A_FULL_NAME)) IS TEAM A")
                
                let teamAShortName = TeamA["Name_Short"]
                PreferenceManager.shared.writeString(key: .TEAM_2_SQUAD_A_SHORT_NAME, value: teamAShortName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_A_SHORT_NAME)) IS SHORT NAME FOR TEAM A")
                
                let TeamB = teamNames["5"]
                let teamBFullName = TeamB["Name_Full"]
                PreferenceManager.shared.writeString(key: .TEAM_2_SQUAD_B_FULL_NAME, value: teamBFullName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_B_FULL_NAME)) IS TEAM B")
                
                
                let teamBShortName = TeamB["Name_Short"]
                PreferenceManager.shared.writeString(key: .TEAM_2_SQUAD_B_SHORT_NAME, value: teamBShortName.stringValue)
//                print("\(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_B_SHORT_NAME)) IS SHORT NAME FOR TEAM B")
                
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
}


extension SummaryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableCell
        
        if indexPath.row == 0 {
            cell.teamALbl.text = PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_A_FULL_NAME)
            cell.teamBLbl.text = PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_B_FULL_NAME)
            
            return cell
            
        } else if indexPath.row == 1 {
            cell.teamALbl.text = PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_A_FULL_NAME)
            cell.teamBLbl.text = PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_B_FULL_NAME)
            
            return cell
            
        } else {
            
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            PreferenceManager.shared.writeString(key: .urlString_1, value: "http://www.sportsadda.com/cricket/live/json/sapk01222019186652.json")
            PreferenceManager.shared.writeBoolean(key: .TEAM_1_LINK_ACTIVE, value: true)
            PreferenceManager.shared.writeBoolean(key: .TEAM_2_LINK_ACTIVE, value: false)
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 1 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            PreferenceManager.shared.writeString(key: .urlString_1, value: "http://www.sportsadda.com/cricket/live/json/nzin01312019187360.json")
            PreferenceManager.shared.writeBoolean(key: .TEAM_2_LINK_ACTIVE, value: true)
            PreferenceManager.shared.writeBoolean(key: .TEAM_1_LINK_ACTIVE, value: false)
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
    
    
    
}

