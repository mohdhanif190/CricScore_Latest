//
//  HomeTableCell.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 01/12/21.
//

import UIKit
import SwiftyJSON

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var teamALbl: UILabel!
    @IBOutlet weak var teamBLbl: UILabel!
    
    @IBOutlet weak var cellBottomView: UIView!
    
    var meta = [MetaData]()
    
    var teamA = [JSON]()
    var teamB = [JSON]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        apiCalling1()
        
        cellView.layer.cornerRadius = 20
        cellView.layer.borderColor = UIColor.black.cgColor
        cellView.layer.borderWidth = 0.5
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowRadius = 3
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowOpacity = 0.3
        cellView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}


extension HomeTableCell {
    
    
    func apiCalling1() {
        
        let urlString = URL(string: "https://www.sportsadda.com/cricket/live/json/sapk01222019186652.json")
        
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            
            guard let data = data else { return }
            do{
                
                let json = try JSON(data:data)
                print(json)
                let result = json["Nuggets"]
//                print(result)
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}
