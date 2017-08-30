//
//  ViewController.swift
//  HeightCellTableView
//
//  Created by Walicki, Pawel (Cognizant) on 8/30/17.
//  Copyright © 2017 es.pawel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    /// Data model
    var model = [MyModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dummy()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    /// Create dummy model
    func dummy() {
        model = [MyModel(imageTitle: "image1", imageURL: "https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA00459_hires.jpg"),
        MyModel(imageTitle: "image2", imageURL: "https://www.planwallpaper.com/static/images/desktop-year-of-the-tiger-images-wallpaper.jpg")]
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellImage.cellId, for: indexPath) as! CellImage

        let current = model[indexPath.row]
        cell.activityIndicator.isHidden = false
       
        Networking.downloadImage(urlStr: current.imageURL) { (img) in
            cell.activityIndicator.isHidden = true
            tableView.beginUpdates()
            
            cell.titleLabel.text = current.imageTitle
            cell.myImageView.image = img
        
            cell.layoutIfNeeded()
            cell.layoutSubviews()
            tableView.endUpdates()
            
        }
        return cell
    }
}
