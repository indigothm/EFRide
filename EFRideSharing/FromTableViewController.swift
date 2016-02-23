//
//  FromTableViewController.swift
//  EFRideSharing
//
//  Created by Ilia Tikhomirov on 28/10/15.
//  Copyright © 2015 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class FromTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
            NewRide.instance.from = "EF Thornwood"
            self.dismissViewControllerAnimated(true, completion: {})
            
        case 1 :
            print("test one")
            clearSelection()
            
            selectedCells.append(indexPath)
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NewRide.instance.from = "Tarrytown"
            self.dismissViewControllerAnimated(true, completion: {});
        
        case 2:
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            clearSelection()
            
            selectedCells.append(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NewRide.instance.from = "White Plains"
            self.dismissViewControllerAnimated(true, completion: {});
            
        case 3:
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            clearSelection()
            
            selectedCells.append(indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            NewRide.instance.from = "Hawthorne Train Station"
            self.dismissViewControllerAnimated(true, completion: {});
            
        default :
            print ("test default")
        
        }
    }



    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
