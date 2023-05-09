//
//  HomeViewPostsCell.swift
//  Opineon
//
//  Created by Vansika Jain on 23/12/22.
//

import UIKit

class HomeViewPostsCell: UITableViewCell {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var profileImage     : UIImageView!
    @IBOutlet weak var titleOfPost      : UILabel!
    @IBOutlet weak var postDescription  : UILabel!
    
    // MARK: - Other Properties
    
    override func awakeFromNib() {
        super.awakeFromNib()                // Initialization code

        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected state
        super.setSelected(selected, animated: animated)
    }
}
