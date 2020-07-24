//
//  UserListProtocol.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

protocol UserListViewProtocol: class {
    func showUsers(with users: [User])
}

protocol UserListPresenterProtocol: class {
    //View -> Presenter
    var interactor: UserListInputInteractorProtocol? {get set}
    var view: UserListViewProtocol? {get set}
    var wireframe: UserListWireFrameProtocol? {get set}

    func viewDidLoad()
    func showUserSelection(with user: User, from view: UIViewController)
}

protocol UserListInputInteractorProtocol: class {
    var presenter: UserListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getUserList()
}

protocol UserListOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func userListDidFetch(userList: [User])
}

protocol UserListWireFrameProtocol: class {
    //Presenter -> Wireframe
    func pushToUserDetail(with user: User,from view: UIViewController)
    static func createUserListModule(userListRef: UserListViewController)
}
