//
//  PostCell.swift
//  Parstagram
//
//  Created by Leonard Box on 11/15/19.
//  Copyright © 2019 Leonard Box. All rights reserved.
//

import UIKit
import Parse

class PostCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var comButton: UIButton!
    
    var favorite = [String]()
    var favorited:Bool = false
    var imageId:String = ""
    var posts = [PFObject]()
    var reposted:Bool = false
 
    var comButtonAction: ((Any) -> Void)?

    @objc func comButtonPressed(sender: Any) {
           self.comButtonAction?(sender)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
    }
    
    @IBAction func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            print("Heart filled")
            favButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
        } else {
            print("Heart empty")
            favButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func favoritePhoto(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            let query = PFQuery(className: "Posts")
            query.getObjectInBackground(withId: imageId)
            if favorited == false {
                self.setFavorite(true)
            } else {
                self.setFavorite(false)
            }
        }
    }
    
    @IBAction func onResend(_ sender: Any) {
    }
    
    @IBAction func onSave(_ sender: Any) {
    }
}

