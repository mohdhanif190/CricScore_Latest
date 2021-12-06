//
//  ScoreBoardVC.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 28/11/21.
//

import UIKit
import SwiftyJSON



class ScoreBoardVC: UIViewController {
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var teamOne = [JSON]()
    var teamTwo = [JSON]()
    
    var squadOne = [JSON]()
    var squadTwo = [JSON]()
    
    var currentTableView: Int!
    
    var teamsData = [Team]()
    var playerData = [Player]()
    var playerBatting = [Batting]()
    
    
    var playerCell: playerDetailsCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "CustomTableCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        ApiCall()
        
        customLoading()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    func customLoading() {
        let loader = self.loader()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stopLoader(loader: loader)
        }
        
    }
    
    
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.appDelegate.showHome()
        }
        
    }
    
    
    
    @IBAction func TeamSwapping(_ sender: UISegmentedControl) {
        
        tableView.reloadData()
    }
    
    
    
    
}

//  MARK: - UITableview Delegate and Datasource functions . . . . .


extension ScoreBoardVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch segmentedView.selectedSegmentIndex {
        case 0:
            return teamOne.count
        case 1:
            return teamTwo.count
        default:
            break
        }
        return 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableCell
        
        let dict1 = teamOne[indexPath.row]
        let dict2 = teamTwo[indexPath.row]
        
        switch segmentedView.selectedSegmentIndex {
        case 0:
            cell.cellNameLabel.text = dict1["Name_Full"].stringValue
            
            // MARK: - Set SegmentedControl Title . . .
            
            if PreferenceManager.shared.readBoolean(key: .TEAM_1_LINK_ACTIVE) == true {
                
                if (cell.cellNameLabel.text == "Imam-ul-Haq") {
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_A_FULL_NAME), forSegmentAt: 0)
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_B_FULL_NAME), forSegmentAt: 1)
                } else if (cell.cellNameLabel.text == "Hashim Amla") {
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_B_FULL_NAME), forSegmentAt: 0)
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_1_SQUAD_A_FULL_NAME), forSegmentAt: 1)
                } else {
                    
                }
                
            } else if PreferenceManager.shared.readBoolean(key: .TEAM_2_LINK_ACTIVE) == true {
                
                if (cell.cellNameLabel.text == "Rohit Sharma") {
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_A_FULL_NAME), forSegmentAt: 0)
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_B_FULL_NAME), forSegmentAt: 1)
                    
                } else if (cell.cellNameLabel.text == "Martin Guptill") {
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_B_FULL_NAME), forSegmentAt: 0)
                    segmentedView.setTitle(PreferenceManager.shared.readString(key: .TEAM_2_SQUAD_A_FULL_NAME), forSegmentAt: 1)
                } else {
                    
                }
            } else {
                
            }
            
            // MARK: - Checking for Captain and Wicket Keeper . . .
            
            if dict1["Iscaptain"] == true && dict1["Iskeeper"] == true {
                
                cell.capD.text = "CAP"
                cell.wkD.text = "WK"
            } else if (dict1["Iskeeper"] == true){
                
                cell.wkD.text = "WK"
                cell.capD.text = ""
            } else if (dict1["Iscaptain"] == true) {
                
                cell.capD.text = "CAP"
                cell.wkD.text = ""
            } else {
                
                cell.capD.text = ""
                cell.wkD.text = ""
            }
            
        case 1:
            cell.cellNameLabel.text = dict2["Name_Full"].stringValue
            
            // MARK: - Checking for Captain and Wicket Keeper . . .
            
            if dict2["Iskeeper"] == true && dict2["Iscaptain"] == true {
                cell.capD.text = "CAP"
                cell.wkD.text = "WK"
            } else if (dict2["Iskeeper"] == true) {
                cell.wkD.text = "WK"
                cell.capD.text = ""
            } else if dict2["Iscaptain"] == true {
                cell.capD.text = "CAP"
                cell.wkD.text = ""
            } else {
                cell.capD.text = ""
                cell.wkD.text = ""
            }
            
        default:
            break
        }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch segmentedView.selectedSegmentIndex {
        case 0:
            if indexPath.row == 0 {
                
                let vc:PlayerDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[0]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[0]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[0]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[0]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[0]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[0]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[0]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[0]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[0]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            } else if indexPath.row == 1 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[1]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[1]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[1]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[1]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[1]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[1]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[1]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[1]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[1]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            } else if indexPath.row == 2 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[2]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[2]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[2]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[2]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[2]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[2]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[2]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[2]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[2]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            } else if indexPath.row == 3 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[3]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[3]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[3]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[3]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[3]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[3]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[3]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[3]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[3]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 4 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[4]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[4]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[4]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[4]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[4]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[4]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[4]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[4]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[4]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 5 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[5]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[5]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[5]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[5]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[5]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[5]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[5]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[5]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[5]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 6 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[6]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[6]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[6]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[6]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[6]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[6]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[6]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[6]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[6]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 7 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[7]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[7]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[7]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[7]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[7]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[7]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[7]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[7]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[7]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 8 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[8]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[8]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[8]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[8]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[8]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[8]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[8]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[8]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[8]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 9 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[9]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[9]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[9]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[9]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[9]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[9]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[9]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[9]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[9]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 10 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamOne[10]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamOne[10]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamOne[10]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamOne[10]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamOne[10]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamOne[10]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamOne[10]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamOne[10]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamOne[10]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else {
                
            }
        case 1:
            if indexPath.row == 0 {
                
                let vc:PlayerDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[0]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[0]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[0]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[0]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[0]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[0]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[0]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[0]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[0]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            } else if indexPath.row == 1 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[1]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[1]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[1]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[1]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[1]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[1]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[1]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[1]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[1]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            } else if indexPath.row == 2 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[2]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[2]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[2]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[2]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[2]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[2]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[2]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[2]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[2]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            } else if indexPath.row == 3 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[3]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[3]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[3]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[3]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[3]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[3]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[3]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[3]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[3]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 4 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[4]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[4]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[4]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[4]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[4]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[4]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[4]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[4]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[4]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 5 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[5]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[5]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[5]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[5]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[5]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[5]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[5]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[5]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[5]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 6 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[6]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[6]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[6]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[6]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[6]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[6]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[6]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[6]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[6]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 7 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[7]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[7]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[7]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[7]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[7]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[7]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[7]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[7]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[7]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 8 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[8]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[8]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[8]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[8]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[8]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[8]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[8]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[8]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[8]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 9 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[9]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[9]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[9]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[9]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[9]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[9]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[9]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[9]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[9]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 10 {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "details") as! PlayerDetailsVC
                vc.strLabel = "\(self.teamTwo[10]["Name_Full"])"
                vc.strBattingStyle = ": \(self.teamTwo[10]["Batting"]["Style"])"
                vc.strbattingAverage = ": \(self.teamTwo[10]["Batting"]["Average"])"
                vc.strBattingStrikeRate = ": \(self.teamTwo[10]["Batting"]["Strikerate"])"
                vc.strRuns = ": \(self.teamTwo[10]["Batting"]["Runs"])"
                
                vc.strBowlingStyle = ": \(self.teamTwo[10]["Bowling"]["Style"])"
                vc.strBowlingAverage = ": \(self.teamTwo[10]["Bowling"]["Average"])"
                vc.strEconomyRate = ": \(self.teamTwo[10]["Bowling"]["Economyrate"])"
                vc.strWickets = ": \(self.teamTwo[10]["Bowling"]["Wickets"])"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else {
                
            }
            
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        if segmentedView.selectedSegmentIndex == 0 {
            let titleHeader = "SQUAD A PLAYING XI"
            return titleHeader
        } else {
            let titleHeader = "SQUAD B PLAYING XI"
            return titleHeader
        }
        
                
        
        
    }
    
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}



// MARK: -  API Calling with URLSession . . .



extension ScoreBoardVC {
    
    
    func ApiCall() {
        
        var request = URLRequest(url: URL(string: PreferenceManager.shared.readString(key: .urlString_1))!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: [:], options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            //            print(data!)
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                
                let jsonObject = JSON(json)
                let data = jsonObject["Teams"]
                
                var allPlayers = [JSON]()
                var teamName = [JSON]()
                
                var battingStyle = [JSON]()
                var bowlingStyle = [JSON]()
                var data1 = [JSON]()
                
                for (_,subJson):(String, JSON) in data {
                    
                    data1.append(subJson["Teams"])
                    teamName.append(subJson["Name_Full"])
                    allPlayers.append(subJson["Players"])
                    battingStyle.append(subJson["Batting"])
                    bowlingStyle.append(subJson["Bowling"])
                    
                }
                
                
                self.teamOne = allPlayers[0].dictionaryValue.values.sorted(by: {$0["Position"].intValue < $1["Position"].intValue})
                
                
                self.teamTwo = allPlayers[1].dictionaryValue.values.sorted(by: {$0["Position"].intValue < $1["Position"].intValue})
                
                
                //                print(self.teamTwo[0]["Batting"])
                
                //                print(self.teamOne[0]["Bowling"])
        
                //                print(self.teamOne[0]["Name_Full"])

                //                print(self.teamOne[5]["Position"])
                
                //                print(self.teamOne[0]["Iskeeper"])
                
                //                print(self.teamOne[0]["Iscaptain"])
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
                
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
    
}

