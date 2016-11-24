//
//  ButtonImage.swift
//  browser
//
//  Created by Apple on 18/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ButtonImage: UIButton {

    let leftImageHeight: CGFloat = 20
    let leftImageWidth: CGFloat = 20
    let leftImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(leftImage)
        print(frame.height)
        leftImage.frame = CGRect(x: 5, y: (frame.height - leftImageHeight) / 2, width: leftImageWidth, height: leftImageHeight)
        // leftImage.backgroundColor = UIColor.green
        leftImage.image = UIImage(named: "apple_logo")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
