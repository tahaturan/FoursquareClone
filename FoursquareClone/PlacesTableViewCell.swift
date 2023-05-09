//
//  PlacesTableViewCell.swift
//  FoursquareClone
//
//  Created by Taha Turan on 9.05.2023.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var placesImageView: UIImageView!
    
    @IBOutlet weak var placesNameLabel: UILabel!
    
    @IBOutlet weak var placesTypeLabel: UILabel!
    
    @IBOutlet weak var placesAtmosphereLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
