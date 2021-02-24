//
//  ViewController.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 22/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Person2, DelegateDemo {
   
    var name: String = "Jayant"
    var adreess: String = "Mumbai"
    var age: Int = 30
    var gender: String = "MALE"

    @IBOutlet weak var lblFirst: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("Imran", forKey: "name1")
        userDefaults.set("Vaibhav", forKey: "name2")
        userDefaults.set("Tejaswi", forKey: "name3")
        userDefaults.set(true, forKey: "isRegistered")
        userDefaults.set(10, forKey: "age")
        
        print("Hello")
        
        let first_name  = userDefaults.string(forKey: "name1")
        let second_name = userDefaults.string(forKey: "name2")
        let third_name = userDefaults.string(forKey: "name3")
        let isRegistered = userDefaults.bool(forKey: "isRegistered")
        let age : Int = userDefaults.integer(forKey: "age")
        
        print(first_name!)
        print(second_name!)
        print(isRegistered)
        print(age)
        
        lblFirst?.text = "Welcome to iOS Tutorial"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("ViewController viewWillAppear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         print("ViewController viewDidAppear called")
        
        print(reading())
        print(walking())
        print(sleeping())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         print("ViewController viewWillDisappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         print("ViewController viewDidDisappear called")
    }
    
    //custom listener
    
    @IBAction func btnNextClicked(_ sender: Any) {
        print("Next Clicked")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        var secondViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.labelName = "This is second Activity"
        secondViewController.delegagteDemo = self
        present(secondViewController, animated: true, completion: nil)
    }
    
    // protocol methods
    
    func reading() -> String {
        return "\(name) aged \(age) years is reading book"
    }
    
    func walking() -> String {
        return "\(name) aged \(age) years walking on the street"
    }
    
    func sleeping() -> String {
        return "\(name) aged \(age) years sleeping on the @ the home"
    }
    
    // delegate methods
    
    func getName(name: String) {
        lblFirst.text = name
    }
}

