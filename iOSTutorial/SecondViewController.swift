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
    

    var thread : Thread?
    
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
        
      //  doThread()
        
       // doGCD()
        
        doOperation()
        
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
        
        thread?.start()
        
        
        
    }
    
    // Thread
    
    func doThread() {
        thread = Thread(target: self, selector: #selector(doThreadFunc), object: nil)
    }
    
    @objc func doThreadFunc() {
        print("Thread Called")
        
    }
    
    //  GCD Grand Central Dispatch
    
//    func doGCD() {
//
////        DispatchQueue.main.async {
////            Util().showToast(view : self.view, message: "GCD")
////        }
//
//        let queue1 = DispatchQueue(label: "queue1")
//
//        queue1.async {
//            for i in 1...5 {
//                print("async1 :\(i)")
//            }
//        }
//
//        queue1.async {
//            for i in 1...5 {
//                print("async2 :\(i)")
//            }
//        }
////
//
////        let queue2 = DispatchQueue(label: "queue2", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.never, target: nil)
////
////        queue2.sync {
////            for i in 1...5 {
////                print("concurrent async1 :\(i)")
////            }
////        }
////
////        queue2.async {
////            for i in 1...5 {
////                print("concurrent async2 :\(i)")
////            }
////        }
//
//
//        let queue3 = DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)
//        queue3.async {
//
//            DispatchQueue.main.async {
//                Util().showToast(view : self.view, message: "GCD")
//            }
//            for i in 1...5 {
//                print("background async1 :\(i)")
//            }
//        }
//
//        }
    
    func doOperation()  {
        
        let queue1 = BlockOperation {
            print("Queue1")
        }
        
        queue1.qualityOfService = .background
        
        let queue2 = BlockOperation {
            print("Queue2")
        }
        
        queue2.qualityOfService = .userInteractive
        
        let queue3 = BlockOperation {
            print("Queue3")
        }
        
        queue3.qualityOfService = .utility
        
        let operationQueue = OperationQueue()
        
        let operationQueue2 = OperationQueue()
        
        operationQueue.maxConcurrentOperationCount = 3
        operationQueue.addOperation(queue1)
        operationQueue.addOperation(queue2)
        operationQueue.addOperation(queue3)
        operationQueue.qualityOfService = .background
    }
}

