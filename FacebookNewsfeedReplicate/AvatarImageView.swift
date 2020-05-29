//
//  AvatarImageView.swift
//  FacebookNewsfeedReplicate
//
//  Created by MM on 5/28/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAvatar()
    }
    override init(image: UIImage?) {
        super.init(image: image)
        setupAvatar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAvatar() {
        //self.makeRounded()
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor(red: 51/255, green: 121/255, blue: 233/255, alpha: 1).cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 16 //self.frame.height / 2
        self.clipsToBounds = true
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    
    func makeRounded() {
        
        
    }
}
