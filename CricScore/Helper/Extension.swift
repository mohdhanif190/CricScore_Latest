//
//  Extension.swift
//  CricScore
//
//  Created by MohdHanif Bhatkar or 01/12/21.
//

import Foundation
import UIKit


extension UIViewController {
    
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .actionSheet)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 0, width: 50, height: 50))
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
        loadingIndicator.style = .medium
        loadingIndicator.color = .black
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        return alert
        
    }
    
    func stopLoader(loader : UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
}


