//
//  AutoViewController.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 01/03/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class AutoViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(doInBackground), name: NSNotification.Name("doInBackground"), object: nil)
    }
    
    @objc func doInBackground(notification : Notification) {
        
        let dictionary = notification.userInfo as! NSDictionary
        
        let title = dictionary["Tejaswi"] as! String
        
        print("doInBackground called")
        
        Util().showToast(view: self.view, message: title)
       
        KeychainWrapper.standard.set("Vaibhav", forKey: "developer1")
        KeychainWrapper.standard.set("Imran", forKey: "developer2")
    
    }
    
    // custom listener
    
    
    @IBAction func btnOkClicked(_ sender: Any) {
        
      //  NotificationCenter.default.post(name: NSNotification.Name("doInBackground"), object: nil)
        
        var myDictionary : [String : String] = ["Lokesh" : "Kurnool", "Tejaswi" : "Satara"]
        NotificationCenter.default.post(name: NSNotification.Name("doInBackground"), object: nil, userInfo: myDictionary)
        
       var dev1 = KeychainWrapper.standard.string(forKey: "developer1") as! String
       var dev2 = KeychainWrapper.standard.string(forKey: "developer2") as! String
        
        print("Developer 1 is : \(dev1)")
        print("Developer 2 is : \(dev2)")
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
