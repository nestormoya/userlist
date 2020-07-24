//
//  UserDetailWireframe.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserDetailWireFrame: UserDetailWireFrameProtocol {
    
    class func createUserDetailModule(with userDetailRef: UserDetailViewController, and user: User) {
      let presenter = UserDetailPresenter()
      presenter.user = user
      userDetailRef.presenter = presenter
      userDetailRef.presenter?.view = userDetailRef
      userDetailRef.presenter?.wireframe = UserDetailWireFrame()
    }
    
    func goBackToUserListView(from view: UIViewController) {
        
    }
    
    deinit {
       // print("UserDetailWireFrame removed")
    }

}
