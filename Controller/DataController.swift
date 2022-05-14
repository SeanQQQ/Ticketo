//
//  DataController.swift
//  Ticketo
//
//  Created by Sean Savanah on 14/5/2022.
//

import Foundation
import SQLite3

class DataController{
    
    static func OpenDatabase() -> OpaquePointer? {
        var db: OpaquePointer?
      
        let fileURL = try! FileManager.default.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("db.sqlite");
        
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK{
            print("Db Connection Success")
            return db
        }else{
            print("Db Connection Failure")
        }
        return nil
    }

}

