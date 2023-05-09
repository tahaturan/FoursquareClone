//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit

class AddPlaceVC: UIViewController {
    
    @IBOutlet weak var placeNameTextField: UITextField!
    
    @IBOutlet weak var placeTypeTextField: UITextField!
    
    @IBOutlet weak var placeAtmosphereTextField: UITextField!
    
    @IBOutlet weak var placeImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    

}

