//
//  PlacesVC.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit
import ParseCore

class PlacesVC: UIViewController {
    
    var placesList = [PlacesModel]()
    var selectedPlace:PlacesModel?
    

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButtonItem()
        logOutBarButtonItem()
        tableView.delegate = self
        tableView.dataSource = self
        
       
        getDataFromParse()
        
      
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
                self.makeAlert(title: "ERROR!", message: error?.localizedDescription ?? "Error!")
            }else{
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
        
    }

}

//MARK: TableView Listeleme islemleri
extension PlacesVC:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlacesTableViewCell
        
        let places = placesList[indexPath.row]
        cell.placesAtmosphereLabel.text = places.placeAtmosphere
        cell.placesImageView.image = places.placeImage
        cell.placesNameLabel.text = places.placeName

        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.choosenPlace = self.selectedPlace
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPlace = placesList[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}




//MARK: Verileri Cekme Parse
extension PlacesVC{
    func getDataFromParse() {
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { objects , error in
            
            if error != nil {
                self.makeAlert(title: "ERROR!", message: error?.localizedDescription ?? "Error!")
            }else{
                
                if objects != nil {
                   
                    
                    for object in objects!{
                        if let placeName = object.object(forKey: "name") as? String {
                            if let placeType = object.object(forKey: "type") as? String {
                                if let placeAtmosphere = object.object(forKey: "atmosphere") as? String {
                                    if let placeLongitude = object.object(forKey: "longitude") as? String {
                                        if let placeLatitude = object.object(forKey: "latitude") as? String {
                                            if object.objectId != nil {
                                                if let imageData = object.object(forKey: "image") as? PFFileObject {
                                                    do {
                                                       let imagesData = try imageData.getData()
                                                        let placesImages = UIImage(data: imagesData)
                                                        
                                                        let placesObject = PlacesModel(placeName: placeName, placeType: placeType, placeAtmosphere: placeAtmosphere, placeImage: placesImages!, placeLatitude: placeLatitude, placeLongitude: placeLongitude)
                                                        self.placesList.append(placesObject)
                                                        
                                                    } catch  {
                                                        print(error)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    self.tableView.reloadData()
                }
                
            }
        }
    }
}





//MARK: Make Alert
extension PlacesVC{
    func makeAlert(title:String , message:String)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        self.present(alertController, animated: true)
    }
}
