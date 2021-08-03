//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Yazmyn Aguilar on 8/3/21.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    @IBOutlet weak var toDoDisplay: UILabel!
    
    var previousToDoTVC = ToDoTableViewController()
    var selectedToDo = ToDoClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toDoDisplay.text = selectedToDo.description
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
