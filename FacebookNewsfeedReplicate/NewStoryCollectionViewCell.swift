//
//  NewStoryCollectionViewCell.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 5/28/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class NewStoryCollectionViewCell: UICollectionViewCell {
    let vwView: UIView = {
        let vw = UIView()
        vw.layer.cornerRadius = 12
        vw.backgroundColor = .blue
        vw.layer.masksToBounds = true
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    let bntAdd: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 18
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let imvAvatar: UIImageView = {
        let imv = UIImageView()
        imv.downloaded(from: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80")
        imv.contentMode = .scaleAspectFill
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    
    let lblNew: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Helvetica-Bold", size: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        
        vwView.addSubview(imvAvatar)
        
        imvAvatar.topAnchor.constraint(equalTo: vwView.topAnchor).isActive = true
        imvAvatar.bottomAnchor.constraint(equalTo: vwView.bottomAnchor).isActive = true
        imvAvatar.leftAnchor.constraint(equalTo: vwView.leftAnchor).isActive = true
        imvAvatar.rightAnchor.constraint(equalTo: vwView.rightAnchor).isActive = true

        vwView.addSubview(bntAdd)
        
        bntAdd.topAnchor.constraint(equalTo: vwView.topAnchor, constant: 8).isActive = true
        bntAdd.leftAnchor.constraint(equalTo: vwView.leftAnchor, constant: 8).isActive = true
        bntAdd.heightAnchor.constraint(equalToConstant: 36).isActive = true
        bntAdd.widthAnchor.constraint(equalToConstant: 36).isActive = true

    }
}
