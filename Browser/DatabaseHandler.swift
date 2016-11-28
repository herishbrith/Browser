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

    func storeData (entityName: String, propertyName: String, value: String) {
        let context = getContext()
        print(entityName)
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

    func getData () {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entityDesc = NSEntityDescription.entity(forEntityName: "UserData", in: context)
        fetchRequest.entity = entityDesc

        do {
            let result = try context.fetch(fetchRequest)
            print(result)
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }

}
