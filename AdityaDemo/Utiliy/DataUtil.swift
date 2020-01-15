
//
//  DataUtil.swift
//  AdityaDemo
//
//  Created by Ravindra Sonkar on 30/11/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import Foundation
import UIKit

struct DataUtil {
    static func addIndicator() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 30, height: 30)
        
        let appDelegate = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
        let backView = UIView(frame: appDelegate!.frame)
        backView.addSubview(activityIndicator)
        backView.tag = 10001
        appDelegate?.window?.addSubview(backView)
    }
    static func removeIndicator() {
        let appDelegate = SceneDelegate().window
        let activityIndi = appDelegate?.subviews.filter { $0.tag == 10001}
        activityIndi?.first?.removeFromSuperview()
    }
}
