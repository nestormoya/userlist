//
//  User.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

struct User {
  var id: Int32!
  var name: String!
  var username: String!
  var email: String!
  var address: Address!
  var phone: String!
  var website: String!
  var company: Company!
  var posts: [Post]!
  
  init(attributes: [String: Any]) {
    self.id = attributes["id"] as? Int32
    self.name = attributes["name"] as? String
    self.username = attributes["username"] as? String
    self.email = attributes["email"] as? String
    self.address = attributes["address"] as? Address
    self.phone = attributes["phone"] as? String
    self.website = attributes["website"] as? String
    self.company = attributes["company"] as? Company
    self.posts = attributes["posts"] as? [Post]
  }
}
