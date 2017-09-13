//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Jean-baptiste Liouville on 12/09/2017.
//  Copyright © 2017 Jean-baptiste Liouville. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTapped(_ sender: Any) {
    
    // Create a Task from the outlet information
    
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        // Add new task to array
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
