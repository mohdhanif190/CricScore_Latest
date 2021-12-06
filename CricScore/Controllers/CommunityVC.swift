//
//  CommunityVC.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 29/11/21.
//

import UIKit

class CommunityVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        mainView.layer.cornerRadius = 10
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowRadius = 3
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowOpacity = 0.3
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    


}
