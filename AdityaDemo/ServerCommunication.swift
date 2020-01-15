//
//  ServerCommunication.swift
//  AdityaDemo
//
//  Created by Ravindra Sonkar on 30/11/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import Foundation

public class ServerComm {
    
    public class var shared : ServerComm {
        struct Static {
            static let instance = ServerComm()
        }
        return Static.instance
    }
    
    public func doRequest(url : URL, success : @escaping (SearchMovies) -> Void, failure : @escaping (String?) -> Void) {
        DataUtil.addIndicator()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                failure(error?.localizedDescription)
                return
            }
            
            let decodeObj = try? JSONDecoder().decode(SearchMovies.self, from: data)
            DispatchQueue.main.async {
                success(decodeObj!)
                DataUtil.removeIndicator()
            }
        }.resume()
        
    }
    
}
