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
        
        getDataParseSample()
        
        
    }


}










//MARK: Parse Veritabanina veri ekleme Ornek
extension ViewController{
    func parseAddDataSample()  {
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Banana"
        parseObject["Calories"] = 150
        
        parseObject.saveInBackground { success , error in
            if error != nil{
                print(error?.localizedDescription ?? "")
            }else{
                print("uploaded")
            }
        }
    }
}

//MARK: Parse Veritabani Veri Cekme Ornek
extension ViewController{
    func getDataParseSample()  {
        
        let query = PFQuery(className: "Fruits")
        
//        query.whereKey("name", equalTo: "Apple") istedigimiz sarta gore veri getirme
        query.whereKey("Calories", greaterThan: 120) // kalorisi 120 den buyuk olanlar gelsin
        
        query.findObjectsInBackground { objects , error in
            if error != nil{
                print(error?.localizedDescription ?? "Error")
            }else{
                
                if let objects  = objects {
                    print(objects)
                }
                
            }
        }
        
        
        
    }
}
