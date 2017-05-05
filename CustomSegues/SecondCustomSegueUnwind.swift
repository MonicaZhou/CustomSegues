//
//  SecondCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by ZhouMonica on 15-1-28.
//  Copyright (c) 2015年 M. All rights reserved.
//

import UIKit

class SecondCustomSegueUnwind: UIStoryboardSegue {
    override func perform() {
        let firstVCView = destination.view as UIView!
        let thirdVCView = source.view as UIView!
        
        let screenHeight = UIScreen.main.bounds.size.height
        
        firstVCView?.frame = (firstVCView?.frame.offsetBy(dx: 0.0, dy: screenHeight))!
        firstVCView?.transform = (firstVCView?.transform.scaledBy(x: 0.001, y: 0.001))!
        
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(firstVCView!, aboveSubview: thirdVCView!)
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            thirdVCView?.transform = (thirdVCView?.transform.scaledBy(x: 0.001, y: 0.001))!
            thirdVCView?.frame = (thirdVCView?.frame.offsetBy(dx: 0.0, dy: -screenHeight))!
            
            firstVCView?.transform = CGAffineTransform.identity
            firstVCView?.frame = (firstVCView?.frame.offsetBy(dx: 0.0, dy: -screenHeight))!
            
            }, completion: { (Finished) -> Void in
                
                self.source.dismiss(animated: false, completion: nil)
        }) 
        
    }
}
