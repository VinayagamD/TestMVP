//
//  PostMVP.swift
//  TestMVP
//
//  Created by Vinayakam D Ganesh on 01/03/17.
//  Copyright © 2017 Vinayakam D Ganesh. All rights reserved.
//

import Foundation

protocol IPostsView : IDialog{
   func successPosts (posts: Array<Post>?)
   func failed( error: ErrorModel)
}

protocol IPostsPresenter {
    func loadPosts( )
}

protocol IPostsModel {
    typealias callbacks = (_ isSuccessful:Bool,_ success: Array<Post>?,_ fail: ErrorModel?)->Void
    func getPosts(callback: callbacks ) -> Array<Post>?
    
}
