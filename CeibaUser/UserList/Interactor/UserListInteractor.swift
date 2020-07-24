//
//  UserListInteractor.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserListInteractor: UserListInputInteractorProtocol {
    
  weak var presenter: UserListOutputInteractorProtocol?
  
  func getUserList() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    UserModule.getUsers(appDelegate: appDelegate){ (success, error, result) in
      if success {
        let userList = result ?? []
        DispatchQueue.main.async {
         self.presenter?.userListDidFetch(userList: userList)
        }
      } else {
        print(error?.localizedDescription ?? "")
      }
    }
  }

  func getAllUserDetail() -> [User] {
    var userList = [User]()
    let allUserDetail = UserModule.generateDataList()
    for item in allUserDetail {
      userList.append(item)
    }
    return userList
  }

}
