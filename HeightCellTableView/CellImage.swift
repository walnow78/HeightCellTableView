//
//  CellImage.swift
//  HeightCellTableView
//
//  Created by Walicki, Pawel (Cognizant) on 8/30/17.
//  Copyright © 2017 es.pawel. All rights reserved.
//

import UIKit

class CellImage: UITableViewCell {
    
    /// Cell id
    static let cellId = "cellImageId"

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
}
