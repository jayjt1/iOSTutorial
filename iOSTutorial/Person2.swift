//
//  Protocol1.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 23/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit

protocol Person1 {
    
    var name : String { get set }
    var adreess : String { get set }
    func reading() -> String
    func walking() -> String
}

protocol Person2 : Person1 {
    
    var age : Int {get set}
    var gender : String {get set}
    
    func sleeping() -> String
}
