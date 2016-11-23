//
//  ViewController.swift
//  browser
//
//  Created by Apple on 17/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    MARK: Properties
//    @IBOutlet weak var browserNameLabel: UILabel!
//    @IBOutlet weak var addressBar: UITextField!
//    @IBOutlet weak var historySwitch: UISwitch!
    let btnWidth: CGFloat = 200
    let btnHeight: CGFloat = 50
    let textBoxWidth: CGFloat = 250
    let textBoxHeight: CGFloat = 25
    let sliderWidth: CGFloat = 150
    let sliderHeight: CGFloat = 25
    let subViewHeight: CGFloat = 100
    let subViewMargins: CGFloat = 5
    let imageWidth: CGFloat = 50
    let imageHeight: CGFloat = 50
    let labelWidth: CGFloat = 150
    let labelHeight: CGFloat = 25
    let textBox = UITextView()
    let btn = ButtonImage()
    let btn2 = UIButton()
    let slider = UISlider()
    let label = UILabel()
//    let subView = SubView()
//    let image = UIImageView()
    var tapCounter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        btn.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - (btnWidth / 2), y: self.view.frame.height / 2 - btnHeight / 2), size: CGSize(width: btnWidth, height: btnHeight))
        textBox.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - textBoxWidth / 2, y: self.view.frame.height / 2 - btnHeight * 2), size: CGSize(width: textBoxWidth, height: textBoxHeight))
        label.frame = CGRect(origin: CGPoint(x: (self.view.frame.width - labelWidth) / 2, y: textBox.frame.origin.y - labelHeight), size: CGSize(width: labelWidth, height: labelHeight))
        slider.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - sliderWidth / 2, y: self.view.frame.height / 2 + sliderHeight * 2), size: CGSize(width: sliderWidth, height: sliderHeight))
        btn2.frame = CGRect(origin: CGPoint(x: (self.view.frame.width - btnWidth) / 2, y: slider.frame.origin.y + btnHeight), size: CGSize(width: btnWidth, height: btnHeight))
        let subView = SubView(frame: CGRect(x: subViewMargins, y: self.view.frame.height - subViewHeight, width: self.view.frame.width - subViewMargins * 2, height: subViewHeight - subViewMargins))

        self.view.addSubview(label)
        self.view.addSubview(textBox)
        self.view.addSubview(btn)
        self.view.addSubview(slider)
        self.view.addSubview(btn2)
        self.view.addSubview(subView)

        self.view.backgroundColor = UIColor.orange
        self.label.text = "Enter your name"
        subView.backgroundColor = UIColor.cyan
        subView.alpha = 0.5
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.isContinuous = true
        slider.value = 5
        slider.addTarget(self, action: #selector(self.slided(sender:)), for: .valueChanged)
        btn.setTitle("Change Picture", for: .normal)
        btn2.setTitle("Change Screen", for: .normal)
        btn.setTitle("Button Disabled!", for: .disabled)
        btn2.setTitle("Button Disabled!", for: .disabled)
//        btn.isEnabled = true
        btn.backgroundColor = UIColor.gray
        btn2.backgroundColor = UIColor.gray
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.buttonClicked(sender:)))
        btn.addGestureRecognizer(gesture)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(self.screenChange(sender:)))
        btn2.addGestureRecognizer(gesture2)
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
        print("Length of string is \(self.textBox.text.characters.count)")
//        (sender.view as! ButtonImage).leftImage.image = UIImage(named: "orange")
        print("Clicked \(tapCounter) times")
    }
    
    func screenChange(sender: UITapGestureRecognizer) {
        print(sender)
        let secondViewController: SecondViewController = SecondViewController()
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func slided(sender: UISlider){
        if sender.value < 1 {
            btn.backgroundColor = UIColor.green
            btn.setTitleColor(UIColor.red, for: .normal)
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

//    MARK: Actions

//    @IBAction func button(sender: UIButton) {
//        self.browserNameLabel.text = "Done"
//    }
}
