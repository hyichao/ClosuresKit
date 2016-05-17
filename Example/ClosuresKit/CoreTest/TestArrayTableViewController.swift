//
//  TestArrayTableViewController.swift
//  ClosuresKit
//
//  Created by HuangCharlie on 5/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class TestArrayTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Test Array+ClosuresKit"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("reuseidentifier")!
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var text = String.init(format: "Test Unit %d: ", indexPath.row+1)
        switch indexPath.row {
        case 0:
            text += "ck_each"
        case 1:
            text += "ck_match"
        case 2:
            text += "ck_select"
        case 3:
            text += "ck_reject"
        case 4:
            text += "ck_map"
        case 5:
            text += "ck_any"
        case 6:
            text += "ck_none"
        case 7:
            text += "ck_all"
        default:
            break
        }
        
        cell.textLabel?.text = text
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            test_ck_each()
        case 1:
            test_ck_match()
        case 2:
            test_ck_select()
        case 3:
            test_ck_reject()
        case 4:
            test_ck_map()
        case 5:
            test_ck_any()
        case 6:
            test_ck_none()
        case 7:
            test_ck_all()
        default:
            break
        }
    }
    
    //Mark: - test units
    func test_ck_each() {
        let nums = [1,2,3,4,5,6]
        nums.ck_each({ (obj) in
            print(obj+1)
        })
    }
    
    func test_ck_match() {
        let strs = ["hello","world","swift","charlie"]
        let ret = strs.ck_match { (obj) -> (Bool) in
            return obj.containsString("ch")
        }
        print(ret)
    }
    
    func test_ck_select() {
        let strs = ["hello","world","swift","charlie"]
        let ret = strs.ck_select { (obj) -> (Bool) in
            if obj.characters.count == 5 {
                return true
            } else {
                return false
            }
        }
        print(ret)
    }
    
    func test_ck_reject() {
        let strs = ["hello","world","swift","charlie"]
        let ret = strs.ck_reject { (obj) -> (Bool) in
            if obj.characters.count == 5 {
                return true
            } else {
                return false
            }
        }
        print(ret)
    }
    
    func test_ck_map() {
        let strs = ["hello","world","swift","charlie"]
        let ret = strs.ck_map { (obj) -> String in
            return obj.stringByAppendingString(".avi")
        }
        print(ret)
    }
    
    func test_ck_any() {
        let strs = ["hello","world","swift","charlie"]
        let ret = strs.ck_any { (obj) -> Bool in
            return obj.containsString("code")
        }
        print(ret)
    }
    
    func test_ck_none() {
        let strs = ["hello","world","swift","charlie"]
        let ret = strs.ck_none { (obj) -> Bool in
            return obj.containsString("code")
        }
        print(ret)
    }
    
    func test_ck_all() {
        let strs = ["hello","world","swift","charlie"]
        let afterMap = strs.ck_map { (obj) -> String in
            return obj.stringByAppendingString(".avi")
        }
        let ret = afterMap.ck_all { (obj) -> Bool in
            return obj.hasSuffix(".avi")
        }
        print(ret)
    }

}
