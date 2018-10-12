//
//  ViewController.swift
//  KeyachainDemo
//
//  Created by Ankur on 10/12/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //save data example
        let data = KeyChain.stringToNSDATA(string: "XYZ")
        let status = KeyChain.save(key: "TestString", data: data)
        print("status = \(status)")
        
        
        //get data example
        if let receivedData = KeyChain.load(key: "TestString") {
            let result = KeyChain.NSDATAtoString(data: receivedData)
            print("Result = \(result)")
        }
        
        
    }
    


}

