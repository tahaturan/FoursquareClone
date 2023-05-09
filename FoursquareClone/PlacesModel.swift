//
//  PlacesModel.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import Foundation
import UIKit


class PlacesModel {
    let placeName : String
    let placeType : String
    let placeAtmosphere : String
    let placeImage : UIImage
    let placeLatitude : String
    let placeLongitude : String
    
    init(placeName: String, placeType: String, placeAtmosphere: String, placeImage: UIImage, placeLatitude: String, placeLongitude: String) {
        self.placeName = placeName
        self.placeType = placeType
        self.placeAtmosphere = placeAtmosphere
        self.placeImage = placeImage
        self.placeLatitude = placeLatitude
        self.placeLongitude = placeLongitude
    }
}
