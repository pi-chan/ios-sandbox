//
//  ViewController.swift
//  SwiftExample
//
//  Created by Hiromasa OHNO on 2014/06/03.
//  Copyright (c) 2014年 xoyip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var sampleLabel : UILabel
    @IBAction func buttonTapped(sender : AnyObject) {
        sampleLabel.text = "button tapped"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

