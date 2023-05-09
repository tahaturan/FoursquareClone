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
        performSegue(withIdentifier: "toMapVC", sender: nil)
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
