//
//  ViewController.swift
//  TestMVP
//
//  Created by Vinayakam D Ganesh on 01/03/17.
//  Copyright © 2017 Vinayakam D Ganesh. All rights reserved.
//

import UIKit


class ViewController: UIViewController,IPostsView, UITableViewDataSource,UITableViewDelegate {

    var presenter:IPostsPresenter!

    @IBOutlet weak var postsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PostPresenter(view: self)
        // Do any additional setup after loading the view, typically from a nib.
        presenter.loadPosts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var posts:Array<Post> = Array<Post>()

      func successPosts(posts: Array<Post>?) {
        if let posts = posts{
            self.posts = posts
            postsTableView.reloadData()
            posts.forEach{post in
                print(post.title!)
            }
        }
    }

     func failed(error: ErrorModel) {
    }

     func displayDialog() {
    }

     func dismissDialog() {
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postTableViewCell:PostTableViewCell = postsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        let post:Post = posts[indexPath.row]
        postTableViewCell.titleLabel.text = post.title
        postTableViewCell.bodyLabel.text = post.body
        postTableViewCell.postIdLabel.text = "\(post.id!)"
        postTableViewCell.userIdLabel.text = "\(post.userId!)"

        return postTableViewCell
    }



}



