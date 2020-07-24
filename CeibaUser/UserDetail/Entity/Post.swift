//
//  Post.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 9/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

struct Post {
  var userId: String!
  var id: Int32!
  var title: String!
  var body: String!
  
  init(attributes: [String: Any]) {
    // print(attributes)
    self.userId = attributes["userId"] as? String
    self.id = attributes["id"] as? Int32
    self.title = attributes["title"] as? String
    self.body = attributes["body"] as? String
  }
}
