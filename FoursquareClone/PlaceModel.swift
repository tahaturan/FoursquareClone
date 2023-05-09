//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import Foundation
import UIKit

class PlaceModel {
    
    static let shatedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    
    private init(){
        
    }
    
}
