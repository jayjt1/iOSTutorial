//
//  File.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 22/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit

class SecondViewController : ViewController {
    
    @IBOutlet weak var lblSecond: UILabel!
    
    var delegagteDemo : DelegateDemo?
    
    var labelName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController viewDidLoad called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController viewWillAppear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController viewDidAppear called")
        
        lblSecond.text = labelName
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController viewWillDisappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondViewController viewDidDisappear called")
    }
    
    // custom listener
    
    
    @IBAction func btnSecondClicked(_ sender: Any) {
        
//        delegagteDemo?.getName(name: "Kajal Gaikwad")
//        self.dismiss(animated: true, completion: nil)
        
    }
}

