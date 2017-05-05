//
//  ViewController.swift
//  CustomSegues
//
//  Created by ZhouMonica on 15-1-28.
//  Copyright (c) 2015年 M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showSecondViewController))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    func showSecondViewController() {
        self.performSegue(withIdentifier: "idFirstSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnFromSegueActions(_ sender: UIStoryboardSegue){
        if sender.identifier == "idFirstSegueUnwind" {
            let originalColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor.red
            
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        }
        else{
            self.lblMessage.text = "Welcome back!"
        }
    }
    
    override func segueForUnwinding(to toViewController: UIViewController, from fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
            else if id == "idSecondSegueUnwind" {
                let unwindSegue = SecondCustomSegueUnwind(identifier: id,
                    source: fromViewController,
                    destination: toViewController,
                    performHandler: { () -> Void in
                        
                })
                
                return unwindSegue
            }
        }
        
        return super.segueForUnwinding(to: toViewController, from: fromViewController, identifier: identifier!)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idFirstSegue" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.message = "Hello from the 1st View Controller"
        }
    }
    
    @IBAction func showThirdViewController(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "idSecondSegue", sender: self)
    }
}

