//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Taha Turan on 8.05.2023.
//

import UIKit
import ParseCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Apple"
        parseObject["Calories"] = 100
        
        parseObject.saveInBackground { success , error in
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else{
                print("uploaded")
            }
        }
        
        
    }


}

