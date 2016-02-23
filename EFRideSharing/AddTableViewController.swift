//
//  AddTableViewController.swift
//  EFRideSharing
//
//  Created by Ilia Tikhomirov on 24/09/15.
//  Copyright (c) 2015 Ilia Tikhomirov. All rights reserved.
//

import UIKit
import Firebase

class AddTableViewController: UITableViewController {

    @IBAction func cancelButtonDidTouch(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var datePickerCell: UITableViewCell!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var ref = Firebase(url: "https://efride.firebaseio.com/Rides")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        datePickerCell.hidden = true
            
        let date = NSDate()
        
        let formatter = NSDateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let defaultTimeZoneStr = formatter.stringFromDate(date)
        
        timeLabel.text = defaultTimeZoneStr
        
        datePicker.minimumDate = NSDate()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okDidTouch(sender: AnyObject) {
        
        let date = datePicker.date
        
        let formatter = NSDateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let defaultTimeZoneStr = formatter.stringFromDate(date)
        
        timeLabel.text = defaultTimeZoneStr
        
        NewRide.instance.time = datePicker.date
        
        datePickerCell.hidden = true
        
       
        
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func createDidTouch(sender: AnyObject) {
        
            let to = self.toLabel.text!
        
            let from = self.fromLabel.text!
        
            let time = self.timeLabel.text!
        
            let dict = ["to": to, "from":  from, "time": time]
        
            let ref = self.ref.childByAppendingPath(String(NSDate()))
            ref.setValue(dict)
        
            self.dismissViewControllerAnimated(true, completion: {});
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if let fromSelectionVal = NewRide.instance.from {
            fromLabel.text = fromSelectionVal
        }
        
        if let toSelectionVal = NewRide.instance.to {
            toLabel.text = toSelectionVal
        }
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
            
        case 2:
           datePickerCell.hidden = false
           let cell = tableView.cellForRowAtIndexPath(indexPath)
           cell?.selected = false
           cell?.accessoryType = UITableViewCellAccessoryType.None
            
            
        default :
            print ("test default")
            
        }
        
    }


}
