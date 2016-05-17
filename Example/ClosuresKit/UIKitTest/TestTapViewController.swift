//
//  TestTapViewController.swift
//  ClosuresKit
//
//  Created by HuangCharlie on 5/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class TestTapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let picker = UIImagePickerController()
        
        let butt = UIButton()
        butt.frame = CGRectMake(100, 100, 100, 100)
        butt.backgroundColor = UIColor.redColor()
        butt.ck_whenTapped { 
            print("Button is tapped")
            self.presentViewController(picker, animated: true, completion: nil)
        }
//        butt.ck_whenDoubleTapped {
//            print("Button is double tapped")
//        }
        butt.ck_whenLongPressed {
            print("Button is long pressed")
        }
        self.view.addSubview(butt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
