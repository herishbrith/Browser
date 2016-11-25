//
//  DatabaseHandler.swift
//  browser
//
//  Created by Apple on 25/11/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import CoreData
import UIKit

class DatabaseHandler {
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func storeData () {
        
    }

}
