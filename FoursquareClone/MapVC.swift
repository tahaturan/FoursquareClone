//
//  MapVC.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit
import MapKit

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
