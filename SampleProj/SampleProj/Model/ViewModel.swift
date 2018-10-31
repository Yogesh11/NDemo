//
//  ViewModel.swift
//  SampleProj
//
//  Created by Yogesh on 10/30/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
  var userModels : [UserModel] = [UserModel]()
    func fetchData(completionBlock  : @escaping Constant.CompletionBlock) {
        ApiManager.sharedInstance.fetchUsers{ (json, error) in
            if let responseJson = json as? [[String : Any]] {
                for model in responseJson{
                    let userModel : UserModel = UserModel()
                    userModel.makeModel(json: model)
                    self.userModels.append(userModel)
                }
            }
            DispatchQueue.main.async {
                completionBlock("Done" as AnyObject, error)
            }
        }


    }
}
