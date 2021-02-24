//
//  FourthViewController.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 24/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UICollectionViewDelegate,  UICollectionViewDataSource {
    
    let util = Util()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // collection delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "grid", for: indexPath) as! CustomGridCell
        cell.imgProfile.image = UIImage(named: "angry_birds_cake")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        util.showToast(view: self.view, message: "postion \(indexPath.row)")
    }

}
