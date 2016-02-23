//
//  ToTableViewController.swift
//  EFRideSharing
//
//  Created by Ilia Tikhomirov on 23/02/16.
//  Copyright © 2016 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class ToTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    var selectedCells = [NSIndexPath]()
    
    func clearSelection() {
        for cellIndex in selectedCells {
            let cell = tableView.cellForRowAtIndexPath(cellIndex)
            cell?.selected = false
            cell?.accessoryType = UITableViewCellAccessoryType.None
            selectedCells.removeAll()
        }
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
            
        case 0 :
            
            print("test zero")
            clearSelection()
            
            selectedCells.append(indexPath)
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NewRide.instance.to = "EF Thornwood"
            self.dismissViewControllerAnimated(true, completion: {})
            
        case 1 :
            print("test one")
            clearSelection()
            
            selectedCells.append(indexPath)
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NewRide.instance.to = "Tarrytown"
            self.dismissViewControllerAnimated(true, completion: {});
            
        case 2:
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            clearSelection()
            
            selectedCells.append(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NewRide.instance.to = "White Plains"
            self.dismissViewControllerAnimated(true, completion: {});
            
        case 3:
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            clearSelection()
            
            selectedCells.append(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NewRide.instance.to = "Hawthorne Train Station"
            self.dismissViewControllerAnimated(true, completion: {});
            
        default :
            print ("test default")
            
        }
    }

}
