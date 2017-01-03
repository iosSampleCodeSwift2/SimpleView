//
//  SimpleViewController4.swift
//  SimpleView
//
//  Created by Daesub Kim on 2016. 11. 22..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class SimpleViewController4: UIViewController {
    
    @IBOutlet weak var aWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "UIWebView"
        
        let url = NSURL(string: "http://dis.dankook.ac.kr/lectures/pmd16/")
        let requestObject = NSURLRequest(URL: url!)
        aWebView.loadRequest(requestObject)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
