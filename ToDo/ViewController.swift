//
//  ViewController.swift
//  ToDo
//
//  Created by bohlool mohammadi on 5/22/18.
//  Copyright © 2018 bohlool mohammadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonSave: UIBarButtonItem!
    @IBOutlet weak var textName: UITextField!
    
    var item: TodoItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let item = item {
            textName.text = item.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if buttonSave as AnyObject === sender as AnyObject {
            let name = textName.text ?? ""
            item = TodoItem(name: name)
        }
    }
    
    @IBAction func cancelAddingItem(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil);
    }

}

