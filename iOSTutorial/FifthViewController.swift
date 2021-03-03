//
//  FifthViewController.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 25/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit
import Alamofire

class FifthViewController: UIViewController {
    
    var strUrl : String = "https://jsonplaceholder.typicode.com/todos/1";
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var labelFifthName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = labelFifthName

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // custom listener
    
    
    @IBAction func btnFetchDataClicked(_ sender: Any) {
        
//        makeSessionAPICalls()
        makeAlamofireCalls()
    }
    
    func makeSessionAPICalls() {
        let url = URL(string: strUrl)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            } else {
               
                let user = try? JSONDecoder().decode(User.self, from: data!)
                
                print("Title \(user?.title)")
                
                DispatchQueue.main.async {
                    self.lblTitle.text = user?.title
                }
            }
            
//            if let data = data,
//                let filmSummary = try? JSONDecoder().decode(FilmSummary.self, from: data) {
//                completionHandler(filmSummary.results ?? [])
//            }
        })
        task.resume()
    }
    
    func makeAlamofireCalls() {
    
        Alamofire.request(strUrl).responseJSON { (response) in
            
            response.result.ifSuccess {
                
                print("Success")
                
                let data = response.data
                
                let json = response.result.value as! [String? : Any]
                
                print("My Title \(json["title"])")
                
                let user = try? JSONDecoder().decode(User.self, from: data!)
                
                print("Title \(user?.title)")
                
                
                
                
                DispatchQueue.main.async {
                    self.lblTitle.text = user?.title
                }
                
                
            }
            response.result.ifFailure {
                
                 print("Failure")
            }
            
        }
    }
    
    
    
    
    
}
