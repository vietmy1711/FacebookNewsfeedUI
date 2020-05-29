//
//  NewsfeedCollectionViewCell.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 5/29/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class NewsfeedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var imvAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    func setupCell() {
        vwContainer.layer.cornerRadius = 12
        
        imvAvatar.downloaded(from: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80")
        self.imvAvatar.makeRounded()
    }
}
