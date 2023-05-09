//
//  PlacesVC.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit
import ParseCore

class PlacesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButtonItem()
        logOutBarButtonItem()
      
    }
    



}


//MARK: Navigation bar button ekleme
extension PlacesVC{
    
    func addBarButtonItem()  {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = barButton
    }
    //Selecyor target
    @objc  func addButtonClicked()  {
          performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
      }
    
    
    func logOutBarButtonItem()  {
        let barButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logOutButtonClikced))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = barButton
    }
    
    @objc func logOutButtonClikced(){
        PFUser.logOutInBackground { error in
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Error", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(okButton)
                self.present(alertController, animated: true)
            }else{
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
        
    }

}
