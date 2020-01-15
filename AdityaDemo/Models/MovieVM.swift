//
//  MovieVM.swift
//  AdityaDemo
//
//  Created by Ravindra Sonkar on 30/12/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import UIKit

class MovieVM : NSObject {
    var movieArray : [MovieDecs]?
}

extension MovieVM : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        let selectedObj = movieArray?[indexPath.row]
        cell.setImage(url: URL(string: selectedObj?.Poster ?? "")!)
        cell.movieName.text = selectedObj?.Title
        cell.releaseDate.text = selectedObj?.Year
        
        return cell
    }
}
extension MovieVM : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/4
        return CGSize(width: width, height: 140)
    }
}
