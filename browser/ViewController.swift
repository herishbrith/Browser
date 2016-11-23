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
    let textBoxWidth: CGFloat = 250
    let textBoxHeight: CGFloat = 25
    let sliderWidth: CGFloat = 150
    let sliderHeight: CGFloat = 25
    let textBox = UITextView()
    let btn = ButtonImage()
    let slider = UISlider()
    var tapCounter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.backgroundColor = UIColor.orange

        btn.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - (btnWidth / 2), y: self.view.frame.height / 2 - btnHeight / 2), size: CGSize(width: btnWidth, height: btnHeight))
        textBox.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - textBoxWidth / 2, y: self.view.frame.height / 2 - btnHeight * 2), size: CGSize(width: textBoxWidth, height: textBoxHeight))
        slider.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - sliderWidth / 2, y: self.view.frame.height / 2 + sliderHeight * 2), size: CGSize(width: sliderWidth, height: sliderHeight))
        self.view.addSubview(btn)
        self.view.addSubview(textBox)
        self.view.addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.isContinuous = true
        slider.value = 5
        slider.addTarget(self, action: #selector(self.slided(sender:)), for: .valueChanged)
        btn.setTitle("My Button", for: .normal)
        btn.setTitle("Button Disabled!", for: .disabled)
//        btn.isEnabled = true
        btn.backgroundColor = UIColor.gray
//        btn2.backgroundColor = UIColor.gray
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.buttonClicked(sender:)))
        btn.addGestureRecognizer(gesture)
//        btn.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchDown)
    }

    func buttonClicked(sender: UITapGestureRecognizer) {
        print(self.textBox.text)
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
    
    func slided(sender: UISlider){
        if sender.value < 1 {
            btn.backgroundColor = UIColor.green
        } else if sender.value < 2 {
            btn.backgroundColor = UIColor.white
        } else if sender.value < 3 {
            btn.backgroundColor = UIColor.black
        } else if sender.value < 4 {
            btn.backgroundColor = UIColor.red
        } else if sender.value < 5 {
            btn.backgroundColor = UIColor.yellow
        } else if sender.value < 6 {
            btn.backgroundColor = UIColor.gray
        } else if sender.value < 7 {
            btn.backgroundColor = UIColor.darkGray
        } else if sender.value < 8 {
            btn.backgroundColor = UIColor.purple
        } else if sender.value < 9 {
            btn.backgroundColor = UIColor.cyan
        } else if sender.value < 10 {
            btn.backgroundColor = UIColor.blue
        } else {
            btn.backgroundColor = UIColor.orange
        }
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
