//
// Created by Vinayakam D Ganesh on 01/03/17.
// Copyright (c) 2017 Vinayakam D Ganesh. All rights reserved.
//

import Foundation
import ObjectMapper

class Post : Mappable{

    var userId:Int?
    var id:Int?
    var title:String?
    var body:String?

    required init?(map: Map) {
        if map.JSON["userId"] == nil{
            return nil
        }
        if map.JSON["id"] == nil{
            return nil
        }
        if map.JSON["title"] == nil{
            return nil
        }
        if map.JSON["body"] == nil{
            return nil
        }

    }

    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }


}
