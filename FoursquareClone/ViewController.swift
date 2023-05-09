//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Taha Turan on 8.05.2023.
//

import UIKit
import ParseCore

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        signInUser()
    }
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        signUpUser()
        
    }
    

}


//MARK: Giris Kontrol islemleri SignIn
extension ViewController{
    func signInUser()  {
        if userNameTextField.text != nil && passwordTextField.text != nil {
            PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!) { user , error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error!")
                }else{
                    //Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
                
                
            }
        }else{
            makeAlert(title: "Error", message: "UserName / Password ??")
        }
    }
}






//MARK: User Olusturma
extension ViewController{
    func signUpUser()  {
        if userNameTextField.text != "" && passwordTextField.text != ""{
            
            let user = PFUser()
            
            user.username = userNameTextField.text!
            user.password = passwordTextField.text!
            
            user.signUpInBackground { success , error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "ERROR!")
                }else{
                    //SignUP basarili ise Hata yoksa
                    //Segue yapilacak
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(title: "Error", message: "UserName / Password ??")
            
        }
    }
}






//MARK: makeAlert
extension ViewController{
    func makeAlert(title:String , message:String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionOKButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertActionOKButton)
        
        self.present(alert, animated: true)
    }
}























//MARK: ---------------------------Parse Database Sample-----------------------------------------------

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
