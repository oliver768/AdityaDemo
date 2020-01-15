

//
//  Make_URL.swift
//  AdityaDemo
//
//  Created by Ravindra Sonkar on 30/11/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import Foundation

struct Make_URL {
    func getUrlAfterSeach(_ searchKey : String) -> String{
        return "https://omdbapi.com/?s=" + searchKey + "&apikey=a0783fa9"
    }
    
    func getUrlForDetail(_ imdbID : String) -> String {
        return "https://omdbapi.com/?i=" + imdbID + "&apikey=a0783fa9"
    }
}
