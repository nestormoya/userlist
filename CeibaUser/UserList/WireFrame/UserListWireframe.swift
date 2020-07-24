//
//  UserListWireframe.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserListWireframe: UserListWireFrameProtocol {
   
  func pushToUserDetail(with user: User,from view: UIViewController) {
    let userDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
    UserDetailWireFrame.createUserDetailModule(with: userDetailViewController, and: user)
    view.navigationController?.pushViewController(userDetailViewController, animated: true)
  }
  
  class func createUserListModule(userListRef: UserListViewController) {
   let presenter: UserListPresenterProtocol & UserListOutputInteractorProtocol = UserListPresenter()
    
    userListRef.presenter = presenter
    userListRef.presenter?.wireframe = UserListWireframe()
    userListRef.presenter?.view = userListRef
    userListRef.presenter?.interactor = UserListInteractor()
    userListRef.presenter?.interactor?.presenter = presenter
  }
    
}
