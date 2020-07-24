//
//  UserDetailPresenter.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserDetailPresenter: UserDetailPresenterProtocol {
    
  weak var view: UserDetailViewProtocol?
  var wireframe: UserDetailWireFrameProtocol?
  var interactor: UserDetailInputInteractorProtocol?
  var user: User?
  
  func viewDidLoad() {
      view?.showUserDetail(with: user!)
  }
  
  func showPostSelection(with post: Post, from view: UIViewController) {
      // wireframe?.pushToPostDetail(with: post, from: view)
  }
  
  func backButtonPressed(from view: UIViewController) {
      
  }
  
  deinit {
      // print("UserDetailPresenter removed")
  }
}
