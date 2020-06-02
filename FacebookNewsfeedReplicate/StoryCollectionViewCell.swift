//
//  StoryCollectionViewCell.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 6/2/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    let storyCollectionView: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.itemSize = CGSize(width: 120, height: 200)
        collectionView.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.backgroundColor = .white
        cv.layer.cornerRadius = 8
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(NewStoryCollectionViewCell.self, forCellWithReuseIdentifier: "NewStoryCollectionViewCell")
        cv.register(StoryCellCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCellCollectionViewCell")
        return cv
    }()
    
    let vwView: UIView = {
        let vw = UIView()
        vw.layer.cornerRadius = 12
        vw.backgroundColor = .white
        vw.layer.masksToBounds = true
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .clear
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(vwView)
        
        vwView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        vwView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        vwView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        vwView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true

        vwView.addSubview(storyCollectionView)
        
        storyCollectionView.topAnchor.constraint(equalTo: vwView.topAnchor, constant: 8).isActive = true
        storyCollectionView.bottomAnchor.constraint(equalTo: vwView.bottomAnchor, constant: -8).isActive = true
        storyCollectionView.leftAnchor.constraint(equalTo: vwView.leftAnchor, constant: 8).isActive = true
        storyCollectionView.rightAnchor.constraint(equalTo: vwView.rightAnchor, constant: -8).isActive = true
    }
}

extension StoryCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            var cell = NewStoryCollectionViewCell()
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewStoryCollectionViewCell", for: indexPath) as! NewStoryCollectionViewCell
            return cell
        }
        var cell = StoryCellCollectionViewCell()
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCellCollectionViewCell", for: indexPath) as! StoryCellCollectionViewCell
        return cell
    }
    
    
}
