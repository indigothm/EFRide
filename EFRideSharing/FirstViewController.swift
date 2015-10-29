//
//  FirstViewController.swift
//  EFRide
//
//  Created by Ilia Tikhomirov on 15/09/15.
//  Copyright (c) 2015 Ilia Tikhomirov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

var rideArray = [Ride]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var ridesTableView: UITableView!
    
    var ref = Firebase(url: "https://efride.firebaseio.com/Rides")
    
   // var cell: RideTableViewCell!
    
  //  var dataSource: FirebaseTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let stringDate = "2015-09-24 18:32"
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let date = formatter.dateFromString(stringDate)
        
        let defaultTimeZoneStr = formatter.stringFromDate(date!);
        
        let timeDisplayFormatter = NSDateFormatter()
        timeDisplayFormatter.dateFormat = "HH:mm"
        
        print("time format")
        print(timeDisplayFormatter.stringFromDate(date!))
        
        print("date + time format")
        print(formatter.stringFromDate(date!))
        
        
        
        
        
        let test = Ride(to: "Tarrytown", from: "White Plains", time: date!)
        rideArray.append(test)
        ridesTableView.reloadData()
        let test2 = Ride(to: "EF", from: "Train Station", time: date!)
        rideArray.append(test2)
        ridesTableView.reloadData()
        
        
       
        // dataSource = FirebaseTableViewDataSource(ref: ref, cellReuseIdentifier: "rideCell", view: self.ridesTableView)

        /*
        dataSource.populateCellWithBlock
            { (cell,snapshot) -> Void in
                
                let tvc: RideTableViewCell = cell as! RideTableViewCell
                
                let snapshot: FDataSnapshot = snapshot as! FDataSnapshot
                
                println(snapshot)
                
               // tvc.timeLabel.text = snapshot.value["time"] as? String
            
                tvc.toLabel.text = snapshot.value["time"] as? String

                
        } 
        */
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            print("test")
            
            for childSnap in  snapshot.children.allObjects as! [FDataSnapshot]{
                
                //Parsing Objects
                let time = childSnap.value["time"] as! String
                let toVal = childSnap.value["to"] as! String
                let fromVal = childSnap.value["from"] as! String
                
                
                print("time -> \(time)")
                print("to -> \(toVal)")
                print("from -> \(fromVal)")
                
                let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm"
                
                let date = formatter.dateFromString(time)
                
                
                /*
                self.cell.timeLabel.text = time
                self.cell.fromLabel.text = fromVal
                self.cell.toLabel.text = toVal
                */
                
                let newCellContent = Ride(to: toVal, from: fromVal, time: date!)
                
                rideArray.append(newCellContent)
                rideArray.sortInPlace({$0.time!.timeIntervalSinceNow < $1.time!.timeIntervalSinceNow})
                
                print("time travel")
                for r in rideArray {
                    print(r.time!)
                
                }
                
                self.ridesTableView.reloadData()
                
                // TODO: Assign cell atributes with their values from database
            }
            
            
            
            
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        
        ridesTableView.delegate = self
        ridesTableView.dataSource = self
       // ridesTableView.dataSource = dataSource
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rideArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = ridesTableView.dequeueReusableCellWithIdentifier("rideCell", forIndexPath: indexPath) as! RideTableViewCell
        
      //  cell.textLabel?.text = "test"

        let dateInfo = rideArray[indexPath.row].time
        let timeDisplayFormatter = NSDateFormatter()
        timeDisplayFormatter.dateFormat = "HH:mm"
        
        
        cell.timeLabel.text = timeDisplayFormatter.stringFromDate(dateInfo!)
        cell.toLabel.text = rideArray[indexPath.row].to
        cell.fromLabel.text = rideArray[indexPath.row].from
        
        print(indexPath.row)
        print(indexPath.length)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

