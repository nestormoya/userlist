//
//  UserCellLabel.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 14/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
  @IBOutlet weak var nameCell: UILabel!
  @IBOutlet weak var phoneCell: UILabel!
  @IBOutlet weak var emailCell: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
