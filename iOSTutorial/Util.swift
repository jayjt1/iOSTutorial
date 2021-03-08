//
//  Util.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 24/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit

class Util {
    
//    static let sharedUtil = Util()
    
    func showToast(view : UIView, message : String) {

        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 40, y: view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    @objc static func displayMsg() {
        print("Thread Called")
    }
    
    
}


