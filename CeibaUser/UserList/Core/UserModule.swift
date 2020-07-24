//
//  Common.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 8/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit
import CoreData

class UserModule: NSObject {

  class func getUsers(appDelegate: AppDelegate, onCompletion: @escaping (_ success: Bool, _ error: Error?, _ result: [User]?)->()){
    var userList = [User]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    userList = self.getUsersLocal(appDelegate: appDelegate)
    if userList.count == 0 {
      guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return  }
      let session = URLSession.shared
      let task = session.dataTask(with: url) { (data, response, error) in
        if let data = data {
          do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] {
              for val in json {
                self.saveUser(appDelegate: appDelegate, newusr: (val as? [String: Any])!)
                userList.append(User(attributes: (val as? [String: Any])!))
              }
            }
          } catch {
            onCompletion(false, error, nil)
            print("Error: \(error)")
          }
        }
        onCompletion(true, nil, userList)
      }
      task.resume()
    }
    onCompletion(true, nil, userList)
  }
  
  class func getUsersLocal(appDelegate: AppDelegate) -> [User] {
    var userList = [User]()
    // let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCeiba")
    //request.predicate = NSPredicate(format: "age = %@", "12")
    request.returnsObjectsAsFaults = false
    do {
      let result = try managedContext.fetch(request)
      for data in result as! [NSManagedObject] {
        let usr = User(attributes: [
          "id": data.value(forKey: "id") as? Int32 ?? 0,
          "name": data.value(forKey: "name") as! String,
          "username": data.value(forKey: "username") as! String,
          "email": data.value(forKey: "email") as! String,
          "phone": data.value(forKey: "phone") as! String,
          "website": data.value(forKey: "website") as! String,
          // "company": data.value(forKey: "company") as! String,
          // "address": data.value(forKey: "address") as! String,
        ])
        userList.append(usr)
      }
    } catch {
        print("Failed")
    }
    return userList
  }
      
  class func saveUser(appDelegate: AppDelegate, newusr: [String: Any]){

    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "UserCeiba", in: managedContext)
    let usr = NSManagedObject(entity: entity!, insertInto: managedContext)
    usr.setValue(newusr["id"] as? Int32, forKey: "id")
    usr.setValue(newusr["name"] as? String, forKey: "name")
    usr.setValue(newusr["username"] as? String, forKey: "username")
    usr.setValue(newusr["email"] as? String, forKey: "email")
    // usr.setValue(nameTask['address'], forKey: "address")
    usr.setValue(newusr["phone"] as? String, forKey: "phone")
    usr.setValue(newusr["website"] as? String, forKey: "website")
    // usr.setValue(newusr["company"], forKey: "company")
    
    do {
      try managedContext.save()
    } catch {
      print("Failed saving")
    }
  }
    
  class func generateDataList() -> [User] {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var userList = self.getUsersLocal(appDelegate: appDelegate)
    if userList.count == 0 {
      self.getUsers(appDelegate: appDelegate){ (success, error, result) in
        if success {
         userList = result ?? []
        } else {
          print(error?.localizedDescription ?? "")
        }
      }
      userList = self.getUsersLocal(appDelegate: appDelegate)
    }
    return userList
  }
    
}
