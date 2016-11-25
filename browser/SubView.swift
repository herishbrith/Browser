//
//  BlankButton.swift
//  browser
//
//  Created by Apple on 23/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class SubView: UIView {
    
    let imageWidth: CGFloat = 50
    let imageHeight: CGFloat = 50
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image.frame = CGRect(x: (frame.width - imageWidth) / 2, y: (frame.height - imageHeight) / 2, width: imageWidth, height: imageHeight)
        self.addSubview(image)
        image.image = UIImage(named: "facebook_logo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
