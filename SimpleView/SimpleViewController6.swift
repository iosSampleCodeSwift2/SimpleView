//
//  SimpleViewController6.swift
//  SimpleView
//
//  Created by Daesub Kim on 2016. 11. 22..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//


import UIKit

class SimpleViewController6: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var aPickerView: UIPickerView!
    
    enum Activity: String {
        case VeryLow = "Very Low"
        case Low = "Low"
        case Medium = "Medium"
        case High = "High"
        case VeryHigh = "Very High"
    }
    let aPickerElements = ["Very Low", "Low", "Medium", "High", "VeryHigh"]
    var activity: Activity = Activity.VeryLow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "UIPickerView"
        
        // connect picker delegate & dataSource
        aPickerView.delegate = self
        aPickerView.dataSource = self
        // set the default value of picker
        aPickerView.selectRow(1, inComponent: 0, animated: true) // Medium
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // the number of columns in picker elements
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // the number of rows in picker elements
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return aPickerElements.count
    }
    
    // the element to return for row and column that’s being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return aPickerElements[row]
    }
    
    // when selected UIPickerView row, call this delegate
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            activity = Activity.VeryLow
        case 1:
            activity = Activity.Low
        case 2:
            activity = Activity.Medium
        case 3:
            activity = Activity.High
        case 4:
            activity = Activity.VeryHigh
        default:
            break
        }
        aLabel.text = activity.rawValue
    }
    
}
