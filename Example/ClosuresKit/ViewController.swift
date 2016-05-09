//
//  ViewController.swift
//  ClosuresKit
//
//  Created by Charlie Huang on 05/09/2016.
//  Copyright (c) 2016 Charlie Huang. All rights reserved.
//

import UIKit
import ClosuresKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let butt = UIButton()
        butt.frame = CGRectMake(100, 100, 100, 100)
        butt.backgroundColor = UIColor.redColor()
        butt.ck_whenTapped()
        self.view.addSubview(butt)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

