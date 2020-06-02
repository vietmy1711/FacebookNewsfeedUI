//
//  ViewController.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 5/28/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let newsfeedCollectionView: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.scrollDirection = .vertical
        //collectionView.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        collectionView.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 270)
        cv.register(UINib(nibName: "NewsfeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsfeedCollectionViewCell")
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsfeedCollectionView.delegate = self
        newsfeedCollectionView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .black
        view.addSubview(newsfeedCollectionView)
        newsfeedCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        newsfeedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        newsfeedCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        newsfeedCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
         super.viewWillLayoutSubviews()

         guard let flowLayout = newsfeedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
           return
         }

        if UIWindow.isLandscape {
           flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 180)
         } else {
           flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
         }

         flowLayout.invalidateLayout()
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            var cell = StoryCollectionViewCell()
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell

            return cell
        }
        var cell = NewsfeedCollectionViewCell()
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsfeedCollectionViewCell", for: indexPath) as! NewsfeedCollectionViewCell

        return cell
    }
}

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
