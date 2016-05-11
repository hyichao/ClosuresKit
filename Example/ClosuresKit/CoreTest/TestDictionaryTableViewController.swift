//
//  TestDictionaryTableViewController.swift
//  ClosuresKit
//
//  Created by HuangCharlie on 5/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class TestDictionaryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Test Dictionary+ClosuresKit"
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
        let nums = ["one":1, "two":2, "three":3, "four":4]
        nums.ck_each { (key,value) in
            let text = String(format: "key is %@; value is %d", key, value)
            print(text)
        }
    }
    
    func test_ck_match() {
        let nums = ["one":1, "two":2, "three":3, "four":4]
        let ret = nums.ck_match { (key,value) -> (Bool) in
            return (key == "two")
        }
        print(ret)
    }
    
    func test_ck_select() {
        let nums = ["one":1, "two":2, "three":3, "four":4,"five":5,"six":6]
        let ret = nums.ck_select { (key,value) -> (Bool) in
            return (value%2 == 0)
        }
        print(ret)
    }
    
    func test_ck_reject() {
        let nums = ["one":1, "two":2, "three":3, "four":4,"five":5,"six":6]
        let ret = nums.ck_reject { (key,value) -> (Bool) in
            return (value%3 == 0)
        }
        print(ret)
    }
    
    func test_ck_map() {
        let nums = ["one":1, "two":2, "three":3, "four":4,"five":5,"six":6]
        let ret = nums.ck_map { (key,value) -> ((String, Int)?) in
            return (key,value*100)
        }
        print(ret)
    }
    
    func test_ck_any() {
        let nums = ["one":1, "two":2, "three":3, "four":4,"five":5,"six":6]
        let ret = nums.ck_any { (key,value) -> (Bool) in
            return (value%4==0)
        }
        print(ret)
    }
    
    func test_ck_none() {
        let nums = ["one":1, "two":2, "three":3, "four":4,"five":5,"six":6]
        let ret = nums.ck_none { (key,value) -> (Bool) in
            return (value%7==0)
        }
        print(ret)
    }
    
    func test_ck_all() {
        let nums = ["one":1, "two":2, "three":3, "four":4,"five":5,"six":6]
        let ret = nums.ck_any { (key,value) -> (Bool) in
            return (value>0)
        }
        print(ret)
    }
}
