//
//  SimpleViewController.swift
//  SimpleView
//
//  Created by Daesub Kim on 2016. 11. 22..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        self.performSegueWithIdentifier("ShowVCS22", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "UIImage"
        
        // programmatically (with no outlet)
        //let imageView = UIImageView(frame:CGRectMake(10, 50, 100, 300))
        //imageView.image = UIImage(named: “smile”)
        //self.view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
