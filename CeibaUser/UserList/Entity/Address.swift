//
//  Address.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

struct Address {
  var street: String!
  var suite: String!
  var city: String!
  var zipcode: String!
  var geo: [String: String]!
  
  init(attributes: [String: AnyObject]) {
    self.street = attributes["street"] as? String
    self.suite = attributes["suite"] as? String
    self.city = attributes["city"] as? String
    self.zipcode = attributes["zipcode"] as? String
    self.geo = attributes["geo"] as? [String : String]
  }
}
