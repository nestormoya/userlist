//
//  UserListViewController.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, UserListViewProtocol {
  
  @IBOutlet var userTblView: UITableView!
  
  var presenter:UserListPresenterProtocol?
  var userList = [User]()
  var filteredUsers = [User]()
  
  var searchController : UISearchController!
  var resultsController = UITableViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.creatingSearhBar()
    UserListWireframe.createUserListModule(userListRef: self)
    
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = UIActivityIndicatorView.Style.medium
    loadingIndicator.startAnimating();
    alert.view.addSubview(loadingIndicator)
    present(alert, animated: true, completion: nil)
    self.presenter?.viewDidLoad()
    dismiss(animated: false, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func showUsers(with users: [User]) {
    self.userList = users
    self.userTblView.rowHeight = 130
    self.userTblView.reloadData()
    self.userTblView.setContentOffset(CGPoint.zero, animated: false)
  }
}

extension UserListViewController: UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = self.userTblView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
      
      let user = searchController.isActive && searchController.searchBar.text != "" ? self.filteredUsers[indexPath.row] : self.userList[indexPath.row]
      cell.nameCell.text = user.name
      cell.phoneCell.text = user.phone
      cell.emailCell.text = user.email
      return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.searchController.isActive ? self.filteredUsers.count : self.userList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      var usr = self.userList[indexPath.row]
      if tableView != self.userTblView {
          usr = self.filteredUsers[indexPath.row]
      }
      self.presenter?.showUserSelection(with: usr, from: self)
    }
    
    func creatingSearhBar() {
      let searchResultsController = UITableViewController(style: UITableView.Style.plain)
      searchResultsController.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
      searchResultsController.tableView.dataSource = self
      searchResultsController.tableView.delegate = self
      searchResultsController.tableView.rowHeight = 130
      self.searchController = UISearchController(searchResultsController: searchResultsController)
      self.searchController.searchResultsUpdater = self
      self.searchController.searchBar.delegate = self
      self.searchController.searchBar.frame = CGRect(
        x: self.searchController.searchBar.frame.origin.x,
        y: self.searchController.searchBar.frame.origin.y,
        width: self.searchController.searchBar.frame.size.width,
        height: 30.0)
      
      self.searchController.searchBar.barTintColor = #colorLiteral(red: 0.1647058824, green: 0.3803921569, blue: 0.1960784314, alpha: 1)
      self.searchController.searchBar.tintColor = .white
      if let textfield = self.searchController.searchBar.value(forKey: "searchField") as? UITextField {
        textfield.backgroundColor = .white
      }
      
      self.searchController.searchBar.keyboardAppearance = UIKeyboardAppearance.dark
      self.view.addSubview(self.searchController.searchBar)
      self.userTblView.tableHeaderView = self.searchController.searchBar
      self.definesPresentationContext = true
      self.searchController.searchBar.sizeToFit()
      self.searchController.searchBar.placeholder = "Search"
    }
    
    func updateSearchResults(for searchController: UISearchController) {
      self.filteredUsers = self.userList.filter { (usr: User) -> Bool in
        if usr.name.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
          return true
        } else{
          return false
        }
      }
      (searchController.searchResultsController as! UITableViewController).tableView.reloadData()
    }
    
}
