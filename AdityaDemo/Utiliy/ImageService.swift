//
//  ImageService.swift
//  FlickrDemo
//
//  Created by Ravindra Sonkar on 31/10/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import UIKit

struct ImageService {
    static func download(withUrl url : URL, completion : @escaping (_ image: UIImage)->()) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, url, error) in
            var downloadedImage:UIImage?
            guard let data = data else {
                return
            }
            downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                completion(downloadedImage ?? UIImage())
            }
        }
        dataTask.resume()
    }
}
