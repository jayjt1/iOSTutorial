//
//  User.swift
//  iOSTutorial
//
//  Created by Jayant Tiwari on 25/02/21.
//  Copyright © 2021 Expleo. All rights reserved.
//

import UIKit
//
//{
//    "userId": 1,
//    "id": 1,
//    "title": "delectus aut autem",
//    "completed": false
//}

class User : Codable {
    
    var userId : Int
    var id : Int
    var title : String
    var completed : Bool
}
