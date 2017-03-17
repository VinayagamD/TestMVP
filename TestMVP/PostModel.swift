//
// Created by Vinayakam D Ganesh on 04/03/17.
// Copyright (c) 2017 Vinayakam D Ganesh. All rights reserved.
//

import Foundation
import ObjectMapper

class PostModel:IPostsModel {


    let apiManager : ApiManager!


    init(){
        self.apiManager = ApiManager()
    }

    func getPosts(callBacks:@escaping IPostsModel.callbacks) {
        apiManager.get(url: URL.POSTS, apiCallback:{(isSuccessful, JSON, error) in
            if isSuccessful{
                if let posts: Array<Post> = Mapper<Post>().mapArray(JSONArray: JSON as! [[String : Any]]) {
                    callBacks(true, posts,nil)
                }else {
                   let errorModel = ErrorModel()
                    errorModel.errorCode = ErrorModel.FORMAT
                    errorModel.message = "Posts Not Available"
                    callBacks(false,nil,errorModel)
                }

            }else {
                callBacks(false,nil,error)
            }
        })


    }

}
