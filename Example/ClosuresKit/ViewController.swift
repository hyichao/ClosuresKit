//
//  ViewController.swift
//  ClosuresKit
//
//  Created by Charlie Huang on 05/09/2016.
//  Copyright (c) 2016 Charlie Huang. All rights reserved.
//

import UIKit
import ClosuresKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Mark: - TableView Delegates and Datasources
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("reuseidentifier")!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var text = " Go To "
        switch indexPath.row {
        case 0:
            text += "Array+ClosuresKit"
        case 1:
            text += "Dictionary+ClosuresKit"
        case 2:
            text += "Set+ClosuresKit"
        case 3:
            text += "UIView+ClosuresKit"
        default:
            break
        }
        cell.textLabel?.text = text
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("TestArrayTableViewController",
                                            sender: self)
        case 1:
            self.performSegueWithIdentifier("TestDictionaryTableViewController",
                                            sender: self)
        case 2:
            self.performSegueWithIdentifier("TestSetTableViewController",
                                            sender: self)
        case 3:
            self.performSegueWithIdentifier("TestTapViewController",
                                            sender: self)
        default:
            break
        }
    }
}





