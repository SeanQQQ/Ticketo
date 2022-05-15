//
//  DataController.swift
//  Ticketo
//
//  Created by Sean Savanah on 14/5/2022.
//

import Foundation
import SQLite3
import CoreData
import UIKit
import CoreData

struct Flite{ //An Bug with XCode has prevented me from naming this struct Flight, the name is reserved by a generated file which i cannot delete
    var to: String
    var from: String
    var date: String
    var id: Int
    
}

class DataController{
    
    static func getFlights() -> [Flite] {
        let flightList = [
            Flite(to: "Calais", from: "London", date: "5/5/2022", id: 1),
            Flite(to: "Moscow", from: "Kyoto", date: "2/6/2022", id: 2),
            Flite(to: "Tokyo", from: "Sydney", date: "7/8/2022", id: 3),
            Flite(to: "Perth", from: "Abu Dhabi", date: "1/6/2022", id: 4)
        ]
        
        return flightList
    }
    
    func addUser(username: String, password: String) {
      
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
      
        let context =
            appDelegate.persistentContainer.viewContext
      
        let entity =
            NSEntityDescription.entity(forEntityName: "Person", in: context)!
      
        let user = NSManagedObject(entity: entity, insertInto: context)

        user.setValue(username, forKeyPath: "username")
        user.setValue(password, forKeyPath: "password")

        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

