//
//  TabBarVC.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar on 28/11/21.
//

import UIKit

class TabBarVC: UITabBarController, UIScrollViewDelegate {

    var lastOffsetY :CGFloat = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastOffsetY = scrollView.contentOffset.y
        
        
    }
    
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        let hide = scrollView.contentOffset.y > self.lastOffsetY
        self.tabBar.isHidden = hide

        
    }
    
}
