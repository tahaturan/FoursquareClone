//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import Foundation
import UIKit

class PlaceModelSingleton {
    
    static let shatedInstance = PlaceModelSingleton()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    
    private init(){
        
    }
    
}
