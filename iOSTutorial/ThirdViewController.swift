//
//  ThirdViewController.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 22/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit

class ThirdViewController : ViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblThird: UITableView!
    
    let util = Util()
    
    var names = ["Saket Newaskar", "Jayant Tiwari", "Lokesh Kuruva", "Vaibhav Keware", "Tejaswi Kadam", "Imran Khan"
    ,"Pallavi Patil", "Kajal Gaikwad"]
    
    var desc = ["Project Manager", "Lead Developer", "Associate Developer", "Associate Developer", "Associate Developer", "Associate Developer","Associate Developer", "Associate Developer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblThird.tableFooterView = UIView()
        
    }
    
    // custom methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "table") as! CustomTableCell
        
        cell.imgProfile.image = UIImage(named: "angry_birds_cake")
        cell.imgNoti.image = UIImage(named: "angry_birds_cake")
        cell.lblTitle.text = names[indexPath.row]
        
        print("Desc is \(desc[indexPath.row])")
        cell.lblDesc.text = desc[indexPath.row]
        
        
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier:"table")
//        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // let welcomeMsg : String = "Welcome \(names[indexPath.row])"
        
      //  util.showToast(view: self.view, message: welcomeMsg)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let fourthViewController = storyBoard.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        present(fourthViewController, animated: true, completion: nil)
        
    }
}
