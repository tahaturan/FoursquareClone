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
        
        placeImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        placeImageView.addGestureRecognizer(gestureRecognizer)

        
    }
    

    

    @IBAction func nextButton(_ sender: Any) {
        
        if placeNameTextField.text != "" && placeTypeTextField.text != "" && placeAtmosphereTextField.text != ""{
            
            if let choosenImage = placeImageView.image {
                
                let placeModel = PlaceModelSingleton.shatedInstance
                placeModel.placeName = placeNameTextField.text!
                placeModel.placeType = placeTypeTextField.text!
                placeModel.placeAtmosphere = placeAtmosphereTextField.text!
                placeModel.placeImage = choosenImage
                
            }
            performSegue(withIdentifier: "toMapVC", sender: nil)
        }else{
            let alertController = UIAlertController(title: "Error", message: "Place Name/Type/Atmosphere ??", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okButton)
            self.present(alertController, animated: true)
        }
        
        
        
       
    }
    

}

//MARK: Resim secme islemleri
extension AddPlaceVC:UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @objc func chooseImage()  {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
}
