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
    let navBarHeight: CGFloat = 50
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
    //let navBar = UINavigationBar()
    //let navItem = UINavigationItem(title: "Browser")
    let textBox = UITextView()
    var btn: ButtonImage!
    let btn2 = UIButton()
    let slider1 = UISlider()
    let slider2 = UISlider()
    let slider3 = UISlider()
    let label = UILabel()
    var subView: SubView!
    //    let image = UIImageView()
    var tapCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.topItem?.title = "Browser"
        
        //navBar.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: self.view.frame.width, height: navBarHeight))
        btn = ButtonImage(frame: CGRect(origin: CGPoint(x: (self.view.frame.width - btnWidth) / 2, y: (self.view.frame.height - btnHeight) / 2 - btnHeight * 2 ), size: CGSize(width: btnWidth, height: btnHeight)))
        textBox.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - textBoxWidth / 2, y: self.view.frame.height / 2 - btnHeight * 3.5), size: CGSize(width: textBoxWidth, height: textBoxHeight))
        label.frame = CGRect(origin: CGPoint(x: (self.view.frame.width - labelWidth) / 2, y: textBox.frame.origin.y - labelHeight), size: CGSize(width: labelWidth, height: labelHeight))
        slider1.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - sliderWidth / 2, y: self.view.frame.height / 2 - sliderHeight), size: CGSize(width: sliderWidth, height: sliderHeight))
        slider2.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - sliderWidth / 2, y: self.view.frame.height / 2), size: CGSize(width: sliderWidth, height: sliderHeight))
        slider3.frame = CGRect(origin: CGPoint(x: self.view.frame.width / 2 - sliderWidth / 2, y: self.view.frame.height / 2 + sliderHeight), size: CGSize(width: sliderWidth, height: sliderHeight))
        btn2.frame = CGRect(origin: CGPoint(x: (self.view.frame.width - btnWidth) / 2, y: slider1.frame.origin.y + btnHeight * 3), size: CGSize(width: btnWidth, height: btnHeight))
        subView = SubView(frame: CGRect(x: subViewMargins, y: self.view.frame.height - subViewHeight, width: self.view.frame.width - subViewMargins * 2, height: subViewHeight - subViewMargins))
        
        textBox.layer.borderWidth = 2.0
        textBox.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.65, alpha: 1.0).cgColor
        //self.view.addSubview(navBar)
        self.view.addSubview(label)
        self.view.addSubview(textBox)
        self.view.addSubview(btn)
        self.view.addSubview(slider1)
        self.view.addSubview(slider2)
        self.view.addSubview(slider3)
        self.view.addSubview(btn2)
        self.view.addSubview(subView)
        
        self.view.backgroundColor = UIColor(white: 2.0, alpha: 0.5)
        self.label.text = "Enter your name"
        //navBar.setItems([navItem], animated: false)
        subView.layer.cornerRadius = 5.0
        subView.layer.borderWidth = 2.0
        subView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.65, alpha: 1.0).cgColor
        subView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 2.0)
        //        subView.backgroundColor = UIColor(hue: 2.0, saturation: 2.0, brightness: 2.0, alpha: 2.0)
        //        subView.alpha = 0.5
        slider1.minimumValue = 0
        slider1.maximumValue = 1
        slider1.isContinuous = true
        slider1.value = 0.5
        slider1.addTarget(self, action: #selector(self.slided(sender:)), for: .valueChanged)
        slider2.minimumValue = 0
        slider2.maximumValue = 1
        slider2.isContinuous = true
        slider2.value = 0.5
        slider2.addTarget(self, action: #selector(self.slided(sender:)), for: .valueChanged)
        slider3.minimumValue = 0
        slider3.maximumValue = 1
        slider3.isContinuous = true
        slider3.value = 0.5
        slider3.addTarget(self, action: #selector(self.slided(sender:)), for: .valueChanged)
        btn.layer.cornerRadius = 8.0
        btn2.layer.cornerRadius = 8.0
        btn.layer.borderWidth = 2.0
        btn2.layer.borderWidth = 2.0
        btn.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderColor = UIColor.black.cgColor
        btn.setTitle("Change Picture", for: .normal)
        btn2.setTitle("Change Screen", for: .normal)
        btn.setTitle("Button Disabled!", for: .disabled)
        btn2.setTitle("Button Disabled!", for: .disabled)
        btn.setTitle("Tapped", for: .highlighted)
        btn2.setTitle("Tapped", for: .focused)
        //        btn.isEnabled = true
        btn.backgroundColor = UIColor.gray
        btn2.backgroundColor = UIColor.gray
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.buttonClicked(sender:)))
        btn.addGestureRecognizer(gesture)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(self.screenChange(sender:)))
        btn2.addGestureRecognizer(gesture2)
    }
    
    func buttonClicked(sender: UITapGestureRecognizer) {
        //        print(self.textBox.text)
        tapCounter += 1
        if let myBtn = sender.view as? ButtonImage {
            if tapCounter % 2 == 1 {
                myBtn.leftImage.image = UIImage(named: "facebook_logo")
                subView.image.image = UIImage(named: "apple_logo")
            } else {
                myBtn.leftImage.image = UIImage(named: "apple_logo")
                subView.image.image = UIImage(named: "facebook_logo")
            }
        }
        print("Length of string is \(self.textBox.text.characters.count)")
        //        (sender.view as! ButtonImage).leftImage.image = UIImage(named: "orange")
        print("Clicked \(tapCounter) times")
    }
    
    func screenChange(sender: UITapGestureRecognizer) {
        //        print(sender)
        //        let secondViewController: SecondViewController = SecondViewController()
        //        self.present(secondViewController, animated: true, completion: nil)
        var data:Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
        data["message"] = self.textBox.text as AnyObject?
        self.navigationController?.pushViewController(SecondViewController(data: data), animated: true)
    }
    
    func slided(sender: UISlider){
        
        //        let sliderValues = [
        //            UIColor.white,
        //            UIColor.black,
        //            UIColor.red,
        //            UIColor.yellow
        //        ]
        //
        //        let index = Int(sender.value)
        //        if sliderValues.indices.contains(index) {
        //            btn.backgroundColor = sliderValues[index]
        //
        //        } else {
        //            btn.backgroundColor = UIColor.orange
        //        }
        
        //        if sender.value < 1 {
        //            btn.backgroundColor = UIColor(red: 1.0, green: 0.25, blue: 0.80, alpha: 0.25)
        //            btn.setTitleColor(UIColor.red, for: .normal)
        //        } else if sender.value < 2 {
        //            btn.backgroundColor = UIColor.white
        //        } else if sender.value < 3 {
        //            btn.backgroundColor = UIColor.black
        //        } else if sender.value < 4 {
        //            btn.backgroundColor = UIColor.red
        //        } else if sender.value < 5 {
        //            btn.backgroundColor = UIColor.yellow
        //        } else if sender.value < 6 {
        //            btn.backgroundColor = UIColor.gray
        //        } else if sender.value < 7 {
        //            btn.backgroundColor = UIColor.darkGray
        //        } else if sender.value < 8 {
        //            btn.backgroundColor = UIColor.purple
        //        } else if sender.value < 9 {
        //            btn.backgroundColor = UIColor.cyan
        //        } else if sender.value < 10 {
        //            btn.backgroundColor = UIColor.blue
        //        } else {
        //            btn.backgroundColor = UIColor.orange
        //        }
        
        //        let colorValue = CGFloat(sender.value)
        //        btn.backgroundColor = UIColor(red: colorValue, green: colorValue, blue: colorValue, alpha: 1.0)
        //        let textColor = UIColor(red: 1.0 - colorValue, green: 1.0 - colorValue, blue: 1.0 - colorValue, alpha: 1.0)
        //        btn.setTitleColor(textColor, for: .normal)
        let redValue = CGFloat(slider1.value)
        let greenValue = CGFloat(slider2.value)
        let blueValue = CGFloat(slider3.value)
        
        btn.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        let textColor = determineContrast(color: btn.backgroundColor!)
        btn.setTitleColor(textColor, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineContrast(color: UIColor) -> UIColor {
        let colorArray = color.cgColor.components!
        return UIColor(red: 1.0 - colorArray[0], green: 1.0 - colorArray[1], blue: 1.0 - colorArray[2], alpha: 1.0)
    }
    
    //    MARK: Actions
    
    //    @IBAction func button(sender: UIButton) {
    //        self.browserNameLabel.text = "Done"
    //    }
}
