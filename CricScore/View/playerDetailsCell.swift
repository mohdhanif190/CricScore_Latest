//
//  playerDetailsCell.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 30/11/21.
//

import UIKit

class playerDetailsCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var BattingStylelbl: UILabel!
    @IBOutlet weak var averagelbl: UILabel!
    @IBOutlet weak var strikeRatelbl: UILabel!
    @IBOutlet weak var runsLbl: UILabel!
    
    var strBattingStylelbl = ""
    var strAveragelbl = ""
    var strStrikeRatelbl = ""
    var strRunslbl = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BattingStylelbl.text = strBattingStylelbl
        averagelbl.text = strAveragelbl
        strikeRatelbl.text = strStrikeRatelbl
        runsLbl.text = strRunslbl
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
