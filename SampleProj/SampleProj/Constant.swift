//
//  Constant.swift
//  SampleProj
//
//  Created by Yogesh on 10/22/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation

struct Constant {
    struct Api {
        static let kEndPoint  = "https://test-api.nevaventures.com/"
        static let kGetRequest = "GET"
    }
    
    struct ErrorMessage {
        static let kGenricErrorTitle    = "Try again!"
        static let kGenericErrorMessage = "Something went wrong. Please try again."
        static let kGenericErrorCode    = "GEC0001"
    }

    typealias CompletionBlock        = (_ result: AnyObject?   , _ error: SCError?) -> Void
}
