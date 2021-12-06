//
//  CustomTableCell.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 29/11/21.
//

import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var cellNameLabel: UILabel!
    
    @IBOutlet weak var capD: UILabel!
    
    @IBOutlet weak var wkD: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 10
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowRadius = 3
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowOpacity = 0.3
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
