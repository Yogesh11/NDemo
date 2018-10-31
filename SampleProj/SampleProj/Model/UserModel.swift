//
//  UserModel.swift
//  SampleProj
//
//  Created by Yogesh on 10/30/18.
//  Copyright © 2018 test. All rights reserved.
//
import UIKit

class UserModel: NSObject {
    var name     : String? = nil
    var imageUrl : URL?    = nil
    var skill    : String? = nil
    var userId   : String? = nil
    func makeModel(json : [String : Any]) {
       name     = json["name"]      as? String
       skill    = json["skills"]    as? String
       userId   = json["id"]        as? String
         if let url = json["image"] as? String , !url.isEmpty , let imgUrl  = URL(string: url) {
                imageUrl  = imgUrl
       }
    }
}
