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

struct flightStruct{
    var to: String
    var from: String
    var date: String
    var id: Int
    
}

struct userStruct{
    var username: String
    var password: String
}

class DataController{
    
    static func getFlights() -> [flightStruct] { //In Production this will access an online Db, but for demonstration purposes it returns a hardcoded array of Flights
        let flightList = [
            flightStruct(to: "Calais", from: "London", date: "5/5/2022", id: 1),
            flightStruct(to: "Moscow", from: "Kyoto", date: "2/6/2022", id: 2),
            flightStruct(to: "Tokyo", from: "Sydney", date: "7/8/2022", id: 3),
            flightStruct(to: "Perth", from: "Abu Dhabi", date: "1/6/2022", id: 4)
        ]
        
        return flightList
    }
    
    static func addUser(username: String, password: String) {
      
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
      
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
      
        let user = NSManagedObject(entity: entity, insertInto: context)

        user.setValue(username, forKeyPath: "username")
        user.setValue(password, forKeyPath: "password")

        do {
            try context.save()
        } catch {
            print("Failure")
        }
    }
    
    static func getUserAndAuth(username: String, password: String) -> userStruct{
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return userStruct(username: "ERR0", password: "ERR0")
                }
      
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        var Users: [NSManagedObject] = []
        
        do{
            Users = try context.fetch(request)
        }catch{
            print("Fetch Failed")
        }
        
        for user in Users {
            let currentUsername = user.value(forKey: "username") as! String
            let currentPassword = user.value(forKey: "password") as! String
            
            if(currentUsername == username){
                if(currentPassword == password){
                    return userStruct(username: currentUsername, password: currentPassword)
                }else{
                    print("not authorized")
                    return userStruct(username: "ERR2", password: "ERR2")
                }
            }
        }
        
        print("user not found")
        return userStruct(username: "ERR1", password: "ERR1")
    }
}

