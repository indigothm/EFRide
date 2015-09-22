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
    
    var firebaseRef = Firebase(url: "https://efride.firebaseio.com/")
    
    var dataSource: FirebaseTableViewDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ridesTableView.delegate = self
        
        self.dataSource = FirebaseTableViewDataSource(ref: firebaseRef,
            modelClass: FDataSnapshot.self,
            cellClass: UITableViewCell.self,
            cellReuseIdentifier: "rideCell",
            view: self.ridesTableView)
        
        self.ridesTableView.dataSource = self.dataSource
        
        self.dataSource.populateCellWithBlock { (cell, obj) -> Void in
            
            // Force cast to an FDataSnapshot
            let snap: FDataSnapshot = obj as! FDataSnapshot
           // let tvc: RideTableViewCell = cell as! RideTableViewCell
            //Test
           //tvc.timeLabel.text = "test"
            
            let tvc: UITableViewCell = cell as! UITableViewCell
            
            tvc.textLabel?.text = snap.value["text"] as? String
            
            
            /* Populate cell with contents of the snapshot */
            println(snap)

        }
        
        
    
      
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

