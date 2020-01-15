//
//  ViewController.swift
//  AdityaDemo
//
//  Created by Ravindra Sonkar on 29/11/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView : UICollectionView!
    let makeUrl = Make_URL()
    var movieVM = MovieVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string : makeUrl.getUrlAfterSeach("Action")) else {
            return
        }
        collectionView.delegate = movieVM
        collectionView.dataSource = movieVM
        ServerComm.shared.doRequest(url: url, success: {[weak self] (searchedMovie) in
            self?.movieVM.movieArray = searchedMovie.Search
            self?.collectionView.reloadData()
        }) {(error) in
            print(error ?? "")
        }
    }
    
    
}

class CollectionCell : UICollectionViewCell {
    @IBOutlet weak var movieImg : UIImageView!
    @IBOutlet weak var movieName  : UILabel!
    @IBOutlet weak var releaseDate : UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImg.image = nil
    }
    func setImage(url : URL) {
        ImageService.download(withUrl: url) { (image) in
            self.movieImg.image = image
        }
    }
}
