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
        DispatchQueue.main.async {
            completionBlock("Done" as AnyObject, nil)
        }

    }
}
