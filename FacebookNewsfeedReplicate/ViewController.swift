//
//  ViewController.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 5/28/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    let newsfeedCollectionView: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 270)
        collectionView.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UINib(nibName: "NewsfeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsfeedCollectionViewCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        newsfeedCollectionView.delegate = self
        newsfeedCollectionView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .black
        view.addSubview(storyCollectionView)
        storyCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        storyCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        storyCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        storyCollectionView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        
        view.addSubview(newsfeedCollectionView)
        //verticalCollectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        newsfeedCollectionView.topAnchor.constraint(equalTo: storyCollectionView.bottomAnchor, constant: 12).isActive = true
        newsfeedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        newsfeedCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        newsfeedCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
         super.viewWillLayoutSubviews()

         guard let flowLayout = newsfeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
           return
         }

        if UIApplication.shared.statusBarOrientation.isLandscape {
           flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 190)
         } else {
           flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 270)
         }

         flowLayout.invalidateLayout()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView {
            return 30
        }
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if collectionView == storyCollectionView {
            if indexPath.row == 0 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewStoryCollectionViewCell", for: indexPath)
                return cell
            }
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCellCollectionViewCell", for: indexPath)
            return cell
        }
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsfeedCollectionViewCell", for: indexPath)
        return cell
    }
}
