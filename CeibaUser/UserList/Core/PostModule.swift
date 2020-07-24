//
//  PostModule.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 9/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//


import UIKit
import CoreData

class PostModule: NSObject {
  
  class func getPosts(appDelegate: AppDelegate, iduser: Int32, onCompletion: @escaping (_ success: Bool, _ error: Error?, _ result: [Post]?)->()) {
    var postsList = [Post]()
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(iduser)") else { return }
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
      // if let response = response {
        // print(response)
      // }
      if let data = data {
        do {
          if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] {
            for val in json {
              let post = Post(attributes: (val as? [String: Any])!)
              postsList.append(post)
            }
            onCompletion(true, nil, postsList)
          }
        } catch {
          print("Error: \(error)")
          onCompletion(false, error, nil)
        }
      }
    }
    task.resume()
  }
  
}
