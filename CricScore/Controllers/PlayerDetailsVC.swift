//
//  PlayerDetailsVC.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 29/11/21.
//

import UIKit

class PlayerDetailsVC: UIViewController {

    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    
    // MARK: -    Batting Details Outlets . . . .
    @IBOutlet weak var batingStyleLbl: UILabel!
    @IBOutlet weak var averageLbl: UILabel!
    @IBOutlet weak var strikeRateLbl: UILabel!
    @IBOutlet weak var runsLbl: UILabel!
    
    
    // MARK: -    Bowling Details Outlets . . . .
    @IBOutlet weak var bowlingStyleLbl: UILabel!
    @IBOutlet weak var bowlingAverageLbl: UILabel!
    @IBOutlet weak var economyRateLbl: UILabel!
    @IBOutlet weak var wicketsLbl: UILabel!
    
    
    // MARK: -    Batting Section Details . . . .
    var strBattingStyle = ""
    var strbattingAverage = ""
    var strBattingStrikeRate = ""
    var strRuns = ""
    
    
    // MARK: -    Bowling Section Details . . . .
    var strBowlingStyle = ""
    var strBowlingAverage = ""
    var strEconomyRate = ""
    var strWickets = ""
    
    var arrBatting = [Batting]()
    var arrBowling = [Bowling]()
    
    var strLabel = ""
    
//    var playerCell = [playerDetailsCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        batingStyleLbl.text = strBattingStyle
        averageLbl.text = strbattingAverage
        strikeRateLbl.text = strBattingStrikeRate
        runsLbl.text = strRuns
        
        
        bowlingStyleLbl.text = strBowlingStyle
        bowlingAverageLbl.text = strBowlingAverage
        economyRateLbl.text = strEconomyRate
        wicketsLbl.text = strWickets
        
        playerName.text = strLabel
        
        
        playerImage.layer.cornerRadius = playerImage.frame.height/2
        playerImage.layer.masksToBounds = true
        playerImage.layer.borderColor = UIColor.black.cgColor
        playerImage.layer.borderWidth = 0.5
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissView))
        swipeGesture.direction = .right
        view.addGestureRecognizer(swipeGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func dismissView(){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        
        dismissView()
    }
    


}

