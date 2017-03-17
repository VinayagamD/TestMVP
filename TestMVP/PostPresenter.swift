//
// Created by Vinayakam D Ganesh on 01/03/17.
// Copyright (c) 2017 Vinayakam D Ganesh. All rights reserved.
//

import Foundation

class PostPresenter:IPostsPresenter {
    let view : IPostsView

    let  model:IPostsModel



    init( view: IPostsView){
        self.view = view;
        model = PostModel()
    }

    func loadPosts() {
        model.getPosts(callBacks:{ (isSuccess, posts, error) in
            if isSuccess{
                self.view.successPosts(posts: posts!)
            }else {
                self.view.failed(error: error!)
            }

        })



    }


}
