//
//  ThirdViewController.swift
//  CustomSegues
//
//  Created by ZhouMonica on 15-1-28.
//  Copyright (c) 2015年 M. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ThirdViewController.showFirstViewController))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func showFirstViewController() {
        self.performSegue(withIdentifier: "idSecondSegueUnwind", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
