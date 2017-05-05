//
//  SecondViewController.swift
//  CustomSegues
//
//  Created by ZhouMonica on 15-1-28.
//  Copyright (c) 2015年 M. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var lblMessage: UILabel!
    var message: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SecondViewController.showFirstViewController))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        lblMessage.text = message! as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showFirstViewController() {
        self.performSegue(withIdentifier: "idFirstSegueUnwind", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "idFirstSegueUnwind" {
    let firstViewController = segue.destination as! ViewController
    firstViewController.lblMessage.text = "You just came back from the 2nd VC"
    }
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
