//
//  SecondViewController.swift
//  browser
//
//  Created by Apple on 23/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {

    let nameLabel = UILabel()
    let label2Width: CGFloat = 150
    let label2Height: CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.frame = CGRect(origin: CGPoint(x: (self.view.frame.width - label2Width) / 2, y: 200), size: CGSize(width: label2Width, height: label2Height))
        self.view.addSubview(nameLabel)
    }
}
