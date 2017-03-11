//
// Created by Vinayakam D Ganesh on 04/03/17.
// Copyright (c) 2017 Vinayakam D Ganesh. All rights reserved.
//

import Foundation
import ObjectMapper

class PostModel:IPostsModel {


    let apiManager : ApiManager!


    init(apiManager: ApiManager){
        self.apiManager = apiManager
    }

    func getPosts(callBack: callbacks) -> Void {
        apiManager.get(url: URL.POSTS, callback:{(isSuccessful, JSON, error) in
            if isSuccessful{
                if let posts: Array<Post> = Mapper<Post>().mapArray(JSONArray: JSON as! [[String : Any]]) {
                    callbacks(true, posts,nil)
                }else {
                    error = ErrorModel()
                    error.errorCode = ErrorModel.FORMAT
                    error.message = "Posts Not Available"
                    callbacks(false,nil,error)
                }

            }else {
                callbacks(false,nil,error)
            }
        })


    }

}
