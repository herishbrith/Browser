//
//  SecondViewController.swift
//  browser
//
//  Created by Apple on 23/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    
    let label2Width: CGFloat = 150
    let label2Height: CGFloat = 25
    let nameLabel = UILabel()
    let backBtn = UIButton()
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        nameLabel.frame = CGRect(origin: CGPoint(x: (self.view.frame.width - label2Width) / 2, y: 200), size: CGSize(width: label2Width, height: label2Height))
        self.view.addSubview(nameLabel)
        self.view.addSubview(backBtn)
        backBtn.setTitle("Back", for: .normal)
        backBtn.frame = CGRect(x: self.view.frame.width / 2.0, y: self.view.frame.height/2, width: 120, height: 50)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.goBack(sender:)))
        backBtn.addGestureRecognizer(gesture)
    }
    
    func goBack(sender: AnyObject? = nil) {
        self.navigationController?.popViewController(animated: false)
    }
    
    init(data: Dictionary<String,AnyObject>){
        super.init(nibName: nil, bundle: nil)
        print(data["message"])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
