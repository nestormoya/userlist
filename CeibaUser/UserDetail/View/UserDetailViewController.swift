//
//  UserDetailViewController.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController, UserDetailViewProtocol {
  
  @IBOutlet weak var lblUserName: UILabel!
  @IBOutlet weak var lblUserPhone: UILabel!
  @IBOutlet weak var lblUserEmail: UILabel!
  @IBOutlet weak var tblUserDetail: UITableView!
  
  var presenter: UserDetailPresenterProtocol?
  var postList = [Post]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  func showUserDetail(with user: User) {
    self.title = user.name
    self.lblUserName.text = user.name
    self.lblUserPhone.text = user.phone
    self.lblUserEmail.text = user.email
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    PostModule.getPosts(appDelegate: appDelegate, iduser: user.id) { (success, error, result) in
       if success {
        self.postList = result ?? []
        DispatchQueue.main.async {
          self.tblUserDetail.rowHeight = 200
          self.tblUserDetail.reloadData()
        }
       } else {
         print(error?.localizedDescription ?? "")
       }
     }
  }

  deinit {
      // print("UserDetailView removed")
  }

}

extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = self.tblUserDetail.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
      let post = self.postList[indexPath.row]
      cell.txtTitle.text = String(post.title).capitalized
      cell.txtContent.text = String(post.body)
      return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.postList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      // presenter?.showPostSelection(with: postList[indexPath.row], from: self)
    }
    
}
