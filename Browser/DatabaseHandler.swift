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

    func storeData (entityName: String, propertyName: String, value: AnyObject) {
        var value = value
        let context = getContext()

        if entityName == "name" {
            value = value as! String as AnyObject
        } else if entityName == "date" {
            value = value as! Date as AnyObject
        }
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let userData = NSManagedObject(entity: entity!, insertInto: context)
        userData.setValue(value, forKey: propertyName)

        do {
            try context.save()
            print("Saved!")
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }

    func getData () -> [NSManagedObject] {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entityDesc = NSEntityDescription.entity(forEntityName: "UserData", in: context)
        fetchRequest.entity = entityDesc
        var result = [NSManagedObject]()

        do {
            let records = try context.fetch(fetchRequest)
            
            if let records = records as? [NSManagedObject] {
                result = records
            }
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return result
    }
    
    func deleteData () {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entityDesc = NSEntityDescription.entity(forEntityName: "UserData", in: context)
        fetchRequest.entity = entityDesc
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }

}
