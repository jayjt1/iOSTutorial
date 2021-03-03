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
        
        
        var myArray : [String] = ["Saket", "Jayant", "Imran", "Kajal", "Pallavi", "Tejaswi", "Lokesh", "Vaibhav"]
        
        var  myDictionary : [String : String] = ["Saket" : "Manager", "Jayant" : "Developer",
                                                 "Imran" : "Developer", "Kajal" : "Developer","Pallavi" : "Developer",
                                                 "Tejaswi" : "Developer", "Lokesh" : "Developer", "Vaibhav" : "Developer"]
        
//        myArray[0]
//
//        myDictionary["Saket"]
        
        
      //  doDefer()
        
       // doGuard()
        
        var add = addNumber(value1: 11.98978, value2: 21.87665)
        
        print("Addition is :\(add)")
        
        doOptional()
        
        let util = Util()
                
    }
    
    func doDefer() {
        defer {
            print("Defer 1")
        }
        print("Print 1")
        print("Print 2")
        print("Print 3")
    }
    
    func doOptional() {
        
        var firstName : Int? = 29
        var lastName : String? = nil
        
       // print(firstName!)
        
        if var first_name = firstName {
            print(first_name)
        } else {
            
            print("No First Name")
        }
        
        if var last_name = lastName {
            print(last_name)
        } else {
            
            print("No Last Name")
        }
    }
    
    func doGuard() {
        
        var managerName : String? = "Saket Newaskar"
    
//        if let myname = managerName {
//
//            print("if condition")
//        } else {
//
//            print("else condition")
//        }
//        print(myname)
        
        guard var guardName = managerName else {
            
            return
        }
        print("Name is \(guardName)")
    }
    
    func addNumber<T: Numeric>(value1 : T, value2 : T) -> T {
        
        return value1 + value2
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
        
        let sum = {
            (value1 : Int, value2 : Int) -> Int in
            return value1 + value2
        }
        
        
        let summation = sum(10, 20)
        
        print("Sum is : \(summation)")
    }
    
    func sum(value1 : Int, value2 : Int) -> Int {
        
        return value1 + value2
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
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//
//        var secondViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//        secondViewController.labelName = "This is second Activity"
//        secondViewController.delegagteDemo = self
//        present(secondViewController, animated: true, completion: nil)
        
        performSegue(withIdentifier: "auto", sender: self)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "second" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.labelName = "This is second Activity"
            secondViewController.delegagteDemo = self
            
        } else if segue.identifier == "fifth" {
            
            let fifthViewController = segue.destination as! FifthViewController
            fifthViewController.labelFifthName = "iOS"
        } else if segue.identifier == "coredata" {
            
            let coreDataViewController = segue.destination as! CoreDataViewController
        }
        
        else if segue.identifier == "auto" {
            
            let autoViewController = segue.destination as! AutoViewController
        }
    }
}

