//
//  Networking.swift
//  HeightCellTableView
//
//  Created by Walicki, Pawel (Cognizant) on 8/30/17.
//  Copyright © 2017 es.pawel. All rights reserved.
//

import UIKit

/// Class implementing download the image
class Networking {
    
    /// Return the image downloaded with completion handler
    static func downloadImage(urlStr: String, completion: @escaping (_ image: UIImage?) -> Void) {
        
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                completion(image)
            }
            }.resume()
    }
}
