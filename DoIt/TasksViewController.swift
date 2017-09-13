//
//  TasksViewController.swift
//  DoIt
//
//  Created by Jean-baptiste Liouville on 11/09/2017.
//  Copyright © 2017 Jean-baptiste Liouville. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tasks = makeTasks ()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            let task = tasks[indexPath.row]
            if task.important {
                cell.textLabel?.text = "❗️\(task.name)"
            } else {
                cell.textLabel?.text = task.name
                
            }
            return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
            
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
            func makeTasks () -> [Task] {
                let task1 = Task()
                task1.name = "Walk the Dog"
                task1.important = false
            
                let task2 = Task()
                task2.name = "Buy Cheese"
                task2.important = true
            
                let task3 = Task()
                task3.name = "Learn Code"
                task3.important = false
            
                return [task1, task2, task3]
                }
            
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
        let nextVC = segue.destination as!
            CreateTaskViewController
        nextVC.previousVC = self 
    }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
             nextVC.previousVC = self 
        }
    }
}

