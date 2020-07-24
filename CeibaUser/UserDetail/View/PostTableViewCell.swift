//
//  PostTableViewCell.swift
//  CeibaUser
//
//  Created by Nestor Moya Yepes on 15/03/20.
//  Copyright © 2020 Nestor Moya Yepes. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var txtContent: UITextView!
  @IBOutlet weak var txtTitle: UITextView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
