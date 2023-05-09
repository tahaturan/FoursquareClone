//
//  MapVC.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit
import MapKit
import ParseCore

class MapVC: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationRightButtonItem()
        navigationLeftButtonItem()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecgnizer:)))
        recognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(recognizer)
    
    }
    
   @objc func chooseLocation(gestureRecgnizer:UIGestureRecognizer)  {
       
       if gestureRecgnizer.state == UIGestureRecognizer.State.began {
           let touches = gestureRecgnizer.location(in: self.mapView)
           let coordinates = self.mapView.convert(touches, toCoordinateFrom: self.mapView)
           
           let annotation = MKPointAnnotation()
           annotation.coordinate = coordinates
           annotation.title = PlaceModel.shatedInstance.placeName
           annotation.subtitle = PlaceModel.shatedInstance.placeType
           
           
           self.mapView.addAnnotation(annotation)
           
           PlaceModel.shatedInstance.placeLatitude = String(coordinates.latitude)
           PlaceModel.shatedInstance.placeLongitude = String(coordinates.longitude)
       }
       
        
    }

}


//MARK: Navigation BarButtonItem
extension MapVC{
    func navigationRightButtonItem()  {
        let barButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBarButtonClikced))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = barButton
    }
    
    @objc func saveBarButtonClikced(){
        //Parse Save islemleri
        let placeModel = PlaceModel.shatedInstance
        
        let object = PFObject(className: "Places")
        object["name"] = placeModel.placeName
        object["type"] = placeModel.placeType
        object["atmosphere"] = placeModel.placeAtmosphere
        object["latitude"] = placeModel.placeLatitude
        object["longitude"] = placeModel.placeLongitude
        
        if let imageData = placeModel.placeImage.jpegData(compressionQuality: 0.5) {
            object["image"] = PFFileObject(name: "image.jpg", data: imageData)
        }
        
        object.saveInBackground { success , error in
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
                
                
            }else{
                self.performSegue(withIdentifier: "fromMapVCtoPlacesVC", sender: nil)
            }
        }
        
    }
    
    func navigationLeftButtonItem()  {
        let barButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backButtonClicked))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = barButton
    }
    
    @objc func backButtonClicked()  {
        self.dismiss(animated: true)
    }
    
}



//MARK: Harita islemleri
extension MapVC:MKMapViewDelegate , CLLocationManagerDelegate{
    
    //Kullanicinin yeri guncellendiginde
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
}
