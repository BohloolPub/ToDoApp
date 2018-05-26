//
//  TodoItemTableViewController.swift
//  ToDo
//
//  Created by bohlool mohammadi on 5/22/18.
//  Copyright © 2018 bohlool mohammadi. All rights reserved.
//

import UIKit

class TodoItemTableViewController: UITableViewController {
    
    var todoItemDataLoader = TodoItemDataLoader()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItemDataLoader.getCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemTableViewCell", for: indexPath) as! TodoItemTableViewCell
        
        let item = todoItemDataLoader.getItem(at: indexPath.row)

        cell.nameLable.text = item!.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todoItemDataLoader.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        todoItemDataLoader.saveItems()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail" {
            let detailViewController = segue.destination.childViewControllers[0] as! ViewController
            if let sellectedCell = sender as? TodoItemTableViewCell {
                let indexPath = tableView.indexPath(for: sellectedCell)!
                detailViewController.item = todoItemDataLoader.getItem(at: indexPath.row)
            }
        }
        else if segue.identifier == "AddItem" {
            
        }
    }
    
    
    @IBAction func unwindToList(sender: UIStoryboardSegue){
        let srcViewController = sender.source as? ViewController
        let item = srcViewController?.item
        if (srcViewController == nil || item?.name == "") {
            return
        }
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            todoItemDataLoader.insert(at: selectedIndexPath.row, todoItem: item!)
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        }
        else {
            let newIndexPath = [IndexPath(row: todoItemDataLoader.getCount(), section: 0)]
            todoItemDataLoader.append(todoItem: item!)
            tableView.insertRows(at: newIndexPath, with: .bottom)
        }
        todoItemDataLoader.saveItems()
    }

}
