//
//  SimpleViewController2.swift
//  SimpleView
//
//  Created by Daesub Kim on 2016. 11. 22..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class SimpleViewController2: UIViewController {
    
    @IBOutlet weak var aImageView: UIImageView!
    
    @IBAction func didSwipe(sender: UISwipeGestureRecognizer) {
        if aImageView.isAnimating() {
            aImageView.stopAnimating()
        } else {
            aImageView.startAnimating()
        }
    }
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        self.performSegueWithIdentifier("ShowVCS33", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "UIImageView"
        
        aImageView.animationImages = [
        UIImage(named: "frame1")!,
        UIImage(named: "frame2")!,
        UIImage(named: "frame3")!,
        UIImage(named: "frame4")!,
        UIImage(named: "frame5")!
        ]
        aImageView.animationDuration = 5
        aImageView.animationRepeatCount = 0
        aImageView.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
