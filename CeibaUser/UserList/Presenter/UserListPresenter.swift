//
//  UserListPresenter.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserListPresenter: UserListPresenterProtocol {
  
  var wireframe: UserListWireFrameProtocol?
  weak var view: UserListViewProtocol?
  var interactor: UserListInputInteractorProtocol?
  
  func showUserSelection(with user: User, from view: UIViewController) {
    wireframe?.pushToUserDetail(with: user, from: view)
  }
  
  func viewDidLoad() {
    self.loadUserList()
  }

  func loadUserList() {
    interactor?.getUserList()
  }
}

extension UserListPresenter: UserListOutputInteractorProtocol {
    
  func userListDidFetch(userList: [User]) {
    self.view?.showUsers(with: userList)
  }
}
