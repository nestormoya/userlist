//
//  UserDetailProtocols.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

protocol UserDetailPresenterProtocol: class {
    
    var wireframe: UserDetailWireFrameProtocol? {get set}
    var view: UserDetailViewProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol UserDetailInputInteractorProtocol: class {
    var presenter: UserListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getPostsList()
}

protocol UserDetailViewProtocol: class {
    //Presenter -> View
    func showUserDetail(with user: User)
}

protocol UserDetailWireFrameProtocol: class {
    func goBackToUserListView(from view: UIViewController)
}
