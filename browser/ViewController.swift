//
//  ViewController.swift
//  browser
//
//  Created by Apple on 17/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
//    @IBOutlet weak var browserNameLabel: UILabel!
//    @IBOutlet weak var addressBar: UITextField!
//    @IBOutlet weak var historySwitch: UISwitch!
    let btnWidth: CGFloat = 200
    let btnHeight: CGFloat = 50
    var tapCounter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.backgroundColor = UIColor.orange

        let btn = ButtonImage(frame: CGRect(origin: CGPoint(x: self.view.frame.width / 2 - (btnWidth / 2), y: self.view.frame.height / 2 - btnHeight / 2), size: CGSize(width: btnWidth, height: btnHeight)))
        self.view.addSubview(btn)
        btn.setTitle("My Button", for: .normal)
        btn.setTitle("Button Disabled!", for: .disabled)
//        btn.isEnabled = true
        btn.backgroundColor = UIColor.gray
        let gesture = UITapGestureRecognizer(target : self, action: #selector(self.buttonClicked(sender:)))
        btn.addGestureRecognizer(gesture)
        // btn.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchDown)
    }

    func buttonClicked(sender: UITapGestureRecognizer) {
        print(sender)
        tapCounter += 1
        if let myBtn = sender.view as? ButtonImage {
            if tapCounter % 2 == 1 {
                myBtn.leftImage.image = UIImage(named: "orange")
            } else {
                myBtn.leftImage.image = UIImage(named: "apple_logo")
            }
        }
        //(sender.view as! ButtonImage).leftImage.image = UIImage(named: "orange")
        print("Clicked \(tapCounter) times")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions

//    @IBAction func button(sender: UIButton) {
//        self.browserNameLabel.text = "Done"
//    }
}
