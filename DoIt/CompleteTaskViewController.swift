//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Jean-baptiste Liouville on 12/09/2017.
//  Copyright © 2017 Jean-baptiste Liouville. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!

    var task = Task()
    var previousVC = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
            
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
