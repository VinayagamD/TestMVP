//
//  ErrorModel.swift
//  TestMVP
//
//  Created by Vinayakam D Ganesh on 01/03/17.
//  Copyright © 2017 Vinayakam D Ganesh. All rights reserved.
//

import Foundation

class ErrorModel{
   static let  FORMAT = 1
   static let  INAVLID_DATA = 5
   static let  UNKNOWN =  6
   static let  SERVER = 2
   static let  UN_AUTHORIZE = 3
   static let  SERVER_TIME_OUT = 4
    
    var errorCode:Int?
    
    var message:String?
    var  error:Error?
}
