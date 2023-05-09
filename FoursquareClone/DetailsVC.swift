//
//  DetailsVC.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit
import MapKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var detailsImageView: UIImageView!
    
    @IBOutlet weak var detailsNameLabel: UILabel!
    
    @IBOutlet weak var detailsTypeLabel: UILabel!
    
    @IBOutlet weak var detailsAtmosphereLabel: UILabel!
    
    @IBOutlet weak var detailsMapView: MKMapView!
    
    var choosenPlace:PlacesModel?
    var placeLatitude = Double()
    var placeLongitude = Double()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let place = choosenPlace {
            detailsImageView.image = place.placeImage
            detailsNameLabel.text = place.placeName
            detailsTypeLabel.text = place.placeType
            detailsAtmosphereLabel.text = place.placeAtmosphere
            placeLatitude = Double(place.placeLatitude)!
            placeLongitude = Double(place.placeLongitude)!
        }
        showMaps()

    }
 
}

//MARK: Hatira islemleri
extension DetailsVC{
    func showMaps()  {
        let location = CLLocationCoordinate2D(latitude: self.placeLatitude, longitude: self.placeLongitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.detailsMapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = self.detailsNameLabel.text
        annotation.subtitle = self.detailsTypeLabel.text
        
        self.detailsMapView.addAnnotation(annotation)
    }
}
