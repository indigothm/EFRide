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


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var ridesTableView: UITableView!
    let textCellIdentifier = "rideCell"
    
    var firebaseRef = Firebase(url: "https://efride.firebaseio.com/Rides")
    var dataSource: FirebaseTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ridesTableView.delegate = self
        
        self.dataSource = FirebaseTableViewDataSource(ref: self.firebaseRef, cellReuseIdentifier: "rideCell", view: self.ridesTableView)
        
        self.ridesTableView.dataSource = self.dataSource
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = ridesTableView.dequeueReusableCellWithIdentifier("rideCell", forIndexPath: indexPath) as! UITableViewCell
        
        var test = "test"
        
        firebaseRef.observeEventType(.Value, withBlock: { snapshot in
            
            println(snapshot.value)
            println("test")
            println(snapshot.value.objectForKey("testRideID"))
            
            for childSnap in  snapshot.children.allObjects as! [FDataSnapshot]{
                
                //Parsing Objects
                let time = childSnap.value["time"] as! String
                let toVal = childSnap.value["to"] as! String
                let fromVal = childSnap.value["from"] as! String
                
                test = fromVal
                
                println("POST")
                println("time -> \(time)")
                println("to -> \(toVal)")
                println("from -> \(fromVal)")
                
                /*
                self.cell.timeLabel.text = time
                self.cell.fromLabel.text = fromVal
                self.cell.toLabel.text = toVal
                */
                
                // TODO: Assign cell atributes with their values from database
            }
            
            
            
            
            }, withCancelBlock: { error in
                println(error.description)
        })
        
       
       /*
       self.dataSource.populateCellWithBlock { (cell: RideTableViewCell, obj: NSObject) -> Void in
            // Populate cell as you see fit, like as below
            cell.timeLabel =
        
            
        
        }
        */
        
        
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

