//
//  TodoItemDataLoader.swift
//  ToDo
//
//  Created by bohlool mohammadi on 5/22/18.
//  Copyright © 2018 bohlool mohammadi. All rights reserved.
//

import Foundation

class TodoItemDataLoader {
    
    var items = [TodoItem]()

    init() {
        items = getSavedItems()
    }
    
    func getSampleItems() -> [TodoItem?] {
        return [TodoItem(name:"Item 1"), TodoItem(name:"Item 2"), TodoItem(name:"Item 3")]
    }
    
    func getSavedItems() -> [TodoItem] {
        if let savedItems = loadItems() {
            return savedItems
        }
        return []
    }
    
    func saveItems() {
        let isSaved = NSKeyedArchiver.archiveRootObject(items, toFile: TodoItem.ARCHIVE_URL.path)
        if !isSaved {
            print("Failed to save to do items...")
        }
    }
    
    func loadItems() -> [TodoItem]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: TodoItem.ARCHIVE_URL.path) as? [TodoItem]
    }
    
    func getCount() -> Int {
        return items.count
    }
    
    func getItem(at index: Int) -> TodoItem? {
        return items[index]
    }
    
    func append(todoItem: TodoItem) {
        items.append(todoItem)
    }
    
    func insert(at index: Int, todoItem: TodoItem) {
        items[index] = todoItem
    }
    
    func remove(at index: Int) {
        items.remove(at: index)
    }
}
