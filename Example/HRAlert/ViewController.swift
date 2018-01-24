//
//  ViewController.swift
//  HRAlert
//
//  Created by obgniyum on 01/24/2018.
//  Copyright (c) 2018 obgniyum. All rights reserved.
//

import UIKit
import HRAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        perform(#selector(alert), on: .main, with: nil, waitUntilDone: false)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        perform(#selector(alert), on: .main, with: nil, waitUntilDone: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func alert() {
        
//        HRAlert.message("success")
        
//        HRAlert.action("success", "OK") {
//            print("next")
//        }
        
        
        HRAlert.choose("Y/N", leftTitle: "Y", leftHandler: {
            print("yes")
        }, rightTitle: "N") {
            print("no")
        }
        
    }
}

