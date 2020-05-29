//
//  StoryCellCollectionViewCell.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 5/28/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class StoryCellCollectionViewCell: UICollectionViewCell {
    let vwView: UIView = {
        let vw = UIView()
        vw.layer.cornerRadius = 12
        vw.backgroundColor = .blue
        vw.layer.masksToBounds = true
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    let imvAvatar: AvatarImageView = {
        let imv = AvatarImageView(image: nil)
        imv.downloaded(from: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80")
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    
    let imvStory: UIImageView = {
        let imv = UIImageView()
        imv.downloaded(from: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80")
        imv.contentMode = .scaleAspectFill
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .clear
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(vwView)
        vwView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        vwView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        vwView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        vwView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
        vwView.addSubview(imvStory)
        
        imvStory.topAnchor.constraint(equalTo: vwView.topAnchor).isActive = true
        imvStory.bottomAnchor.constraint(equalTo: vwView.bottomAnchor).isActive = true
        imvStory.leftAnchor.constraint(equalTo: vwView.leftAnchor).isActive = true
        imvStory.rightAnchor.constraint(equalTo: vwView.rightAnchor).isActive = true

        vwView.addSubview(imvAvatar)
        
        imvAvatar.topAnchor.constraint(equalTo: vwView.topAnchor, constant: 8).isActive = true
        imvAvatar.leftAnchor.constraint(equalTo: vwView.leftAnchor, constant: 8).isActive = true
        imvAvatar.heightAnchor.constraint(equalToConstant: 32).isActive = true
        imvAvatar.widthAnchor.constraint(equalToConstant: 32).isActive = true

    }
}
