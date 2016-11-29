//
//  SecondViewController.swift
//  browser
//
//  Created by Apple on 23/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let label2Width: CGFloat = 150
    let label2Height: CGFloat = 25
    let nameLabel = UILabel()
    let backBtn = UIButton()
    var itemsToLoad = Array<String>()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.bounds, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.view.addSubview(tableView)
//        self.view.backgroundColor = UIColor.orange
//        nameLabel.frame = CGRect(origin: CGPoint(x: (self.view.frame.width - label2Width) / 2, y: 200), size: CGSize(width: label2Width, height: label2Height))
//        self.view.addSubview(nameLabel)
//        self.view.addSubview(backBtn)
//        backBtn.setTitle("Back", for: .normal)
//        backBtn.frame = CGRect(x: self.view.frame.width / 2.0, y: self.view.frame.height/2, width: 120, height: 50)
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.goBack(sender:)))
//        backBtn.addGestureRecognizer(gesture)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToLoad.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        print(indexPath.row)
        cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        return cell
    }

    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
    }

//    func goBack(sender: AnyObject? = nil) {
//        self.navigationController?.popViewController(animated: false)
//    }

    init(data: Dictionary<String,AnyObject>){
        super.init(nibName: nil, bundle: nil)
        let databaseHandler = DatabaseHandler()
        let message = data["message"] as! String
        
        if message.characters.count > 0 {
            databaseHandler.storeData(entityName: "UserData", propertyName: "name", value: message as AnyObject)
            databaseHandler.storeData(entityName: "UserData", propertyName: "date", value: Date() as AnyObject)
        }
        let userData = databaseHandler.getData()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyy hh:mm:ss"
        
        for datum in userData {
            if let name = datum.value(forKey: "name") as? String {
                itemsToLoad.append(name)
            }
            if let date = datum.value(forKey: "date") as? Date {
                itemsToLoad.append(dateFormatter.string(from: date))
            }
        }
//        databaseHandler.deleteData()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
