//
//  CoreDataViewController.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 26/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: ViewController {
    
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // custom listeners
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        
        var first = txtFirstName.text as! String
        var last = txtLastName.text as! String
        
        saveData(first_name: first, last_name: last)
    }
    
    
    @IBAction func btnFetchClicked(_ sender: Any) {
        
        fetch()
    }
    
    func saveData(first_name : String, last_name : String) {
        
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
        // 1
        let managedContext = appDelegate?.persistentContainer.viewContext as! NSManagedObjectContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Person",in: managedContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(first_name, forKeyPath: "first_name")
        person.setValue(last_name, forKeyPath: "last_name")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func fetch()  {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        // 1
        let managedContext = appDelegate?.persistentContainer.viewContext as! NSManagedObjectContext
        
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        
        
        do {
            let persons = try managedContext.fetch(fetchRequest)
            
            for var person in persons {
                
                var firstName = person.value(forKey: "first_name") as! String
                
                var lastName = person.value(forKey: "last_name") as! String
                
                print(firstName)
                print(lastName)
                
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }    }
    
}
