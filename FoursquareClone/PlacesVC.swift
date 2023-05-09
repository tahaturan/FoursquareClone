//
//  PlacesVC.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit

class PlacesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButtonItem()
      
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
          
      }

}
