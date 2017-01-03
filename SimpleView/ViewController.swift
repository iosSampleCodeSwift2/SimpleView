//
//  ViewController.swift
//  SimpleView
//
//  Created by Daesub Kim on 2016. 11. 22..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var aTableView: UITableView!

    var views = ["UIImage", "UIImageView",  "UIScrollView", "UIWebView","UIMapView", "UIPickerView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Various Views"
        aTableView.delegate = self
        aTableView.dataSource = self
        aTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return views.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: UITableViewCell = aTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        cell.textLabel?.text = views[indexPath.row]
        //cell.imageView?.image = images[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        print(cell.textLabel?.text)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print("You selected cell #\(indexPath.row)")
        
        //let aViewController: SimpleViewController = storyboard?.instantiateViewControllerWithIdentifier(“SimpleViewController”) as! SimpleViewController
        //aViewController.title = views[indexPath.row]
        //navigationController?.pushViewController(aViewController, animated: true)
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("ShowSVC1", sender: self)
        case 1:
            self.performSegueWithIdentifier("ShowSVC2", sender: self)
        case 2:
            self.performSegueWithIdentifier("ShowSVC3", sender: self)
        case 3:
            self.performSegueWithIdentifier("ShowSVC4", sender: self)
        case 4:
            self.performSegueWithIdentifier("ShowSVC5", sender: self)
        case 5:
            self.performSegueWithIdentifier("ShowSVC6", sender: self)
        default:
            break
        }
    }


}

