//
//  TodoItem.swift
//  ToDo
//
//  Created by bohlool mohammadi on 5/22/18.
//  Copyright © 2018 bohlool mohammadi. All rights reserved.
//

import Foundation

class TodoItem: NSObject, NSCoding {
    static let DIR = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ARCHIVE_URL = DIR.appendingPathComponent("todo-items")
    
    var name: String
    
    init?(name: String) {
        self.name = name
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        self.init(name: name)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
}
