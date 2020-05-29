//
//  NewsfeedCollectionViewCell.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 5/28/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class NewsfeedCollectionViewCell: UICollectionViewCell {
    let vwView: UIView = {
           let vw = UIView()
           vw.translatesAutoresizingMaskIntoConstraints = false
           vw.backgroundColor = .red
           
           return vw
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
           //let gesture = UITapGestureRecognizer(target: self, action: #selector(viewOnClick))
           //vwView.addGestureRecognizer(gesture)
           contentView.addSubview(vwView)
           vwView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
           vwView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
           vwView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
           vwView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
           
       }
}
