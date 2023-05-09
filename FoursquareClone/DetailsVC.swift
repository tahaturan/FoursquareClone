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
        detailsMapView.delegate = self
        
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
extension DetailsVC:MKMapViewDelegate{
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
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil{
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }else{
            pinView?.annotation = annotation
        }
        
        return pinView
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.placeLatitude != 0.0 && self.placeLongitude != 0.0{
            let requestLocation = CLLocation(latitude: self.placeLatitude, longitude: self.placeLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placeMarks , error in
                if let placeMark = placeMarks {
                    
                    if placeMark.count > 0{
                        let mkPlaceMark = MKPlacemark(placemark: placeMark[0])
                        let mapItem = MKMapItem(placemark: mkPlaceMark)
                        
                        mapItem.name = self.detailsNameLabel.text
                        mapItem.openInMaps()
                    }
                    
                    
                }
            }
        }
    }
    
    
}
