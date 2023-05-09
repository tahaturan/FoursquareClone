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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationRightButtonItem()
        navigationLeftButtonItem()

    
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


