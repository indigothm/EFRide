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



class FirstViewController: UIViewController, UITableViewDelegate  {
    
    @IBOutlet weak var ridesTableView: UITableView!
    
    var ref = Firebase(url: "https://efride.firebaseio.com/Rides")
    
    var dataSource: FirebaseTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource = FirebaseTableViewDataSource(ref: ref, cellReuseIdentifier: "rideCell", view: self.ridesTableView)

        
        dataSource.populateCellWithBlock
            { (cell,snapshot) -> Void in
                
                let tvc: UITableViewCell = cell as! UITableViewCell
                let snapshot: FDataSnapshot = snapshot as! FDataSnapshot
                
                tvc.textLabel?.text = snapshot.value["from"] as? String
                
        }
        
        
        ridesTableView.delegate = self
        ridesTableView.dataSource = dataSource
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ridesTableView.dequeueReusableCellWithIdentifier("rideCell", forIndexPath: indexPath) as! UITableViewCell
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

