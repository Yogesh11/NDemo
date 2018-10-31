//
//  DBManager.swift
//  SampleProj
//
//  Created by Yogesh on 10/22/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import CoreData
/// This class is used to interact with DB.
class DBManager: NSObject {
    static let sharedInstance = DBManager()
    
    private override init() {
        super.init()
    }

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "SampleProj")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


    private func insertRow(entityName name : String) -> AnyObject {
        let viewContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: name, in: viewContext)
        let entityObj = NSManagedObject(entity: entity!, insertInto: viewContext)
        return entityObj
    }

    func deleteEntity(entityName name : String, predicate : NSPredicate?) {
        let fetch        = NSFetchRequest<NSFetchRequestResult>(entityName: name)
        fetch.predicate  = predicate
        let request      = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try persistentContainer.viewContext.execute(request)
            saveContext()
        } catch{
            print("Failed to delete entity: \(name)")
        }
//        query           =  NSPredicate(format: "action != %@ && instanceId != %@" , ZConstant.ZInstanceAction.zSave, excludedID)
   //     NSPredicate(format: "NOT(projectId IN %@)" ,  excludedProjectIDs)
    }

    func removeAll(){
        var baseString : String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
        var pathComponents = [baseString]
        var fileManager:FileManager  = FileManager.default
        var fileURL = NSURL.fileURL(withPathComponents: pathComponents)!
        let error : Error? = nil
//        fileManager.removeItemAtURL(NSURL.fileURLWithPathComponents(pathComponents)!, error: &error)
    }

    private func readEntity(entityName      : String ,
                            predicate       : NSPredicate?,
                            sortDescriptors : [NSSortDescriptor]? = nil) -> Array<NSManagedObject>? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        do {
            let result = try persistentContainer.viewContext.fetch(request) as? [NSManagedObject]
            if let entityStorage  = result {
                if entityStorage.isEmpty == false {
                    return entityStorage
                }
            }

        } catch {
           print("Failed to get \(error.localizedDescription)")
        }
        return nil
    }

    func saveContext(){
        if Thread.isMainThread == true  {
            saveDbChanges()
        } else{
            DispatchQueue.main.sync {
                saveDbChanges()
            }
        }
    }
    
    private func saveDbChanges() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }



}
