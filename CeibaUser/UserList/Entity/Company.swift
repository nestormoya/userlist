//
//  Company.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import Foundation

struct Company {
  var name: String!
  var catchPhrase: String!
  var bs: String!
  
  init(attributes: [String: String]) {
      self.name = attributes["name"]
      self.catchPhrase = attributes["catchPhrase"]
      self.bs = attributes["bs"]
  }
}
