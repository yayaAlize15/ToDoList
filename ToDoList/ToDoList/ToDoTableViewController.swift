//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Yazmyn Aguilar on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    //var listOfToDo : [ToDoClass] = []
    var listOfToDo : [ToDoCD] = []
    
    func getToDos() {
        if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD]{
                listOfToDo = dataFromCoreData
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //listOfToDo = createToDo()
    }
    
    /*func createToDo() -> [ToDoClass] {
        
        let swiftToDo = ToDoClass()
        swiftToDo.description = "Learn Swift"
        swiftToDo.important = true
        
        let dogToDo = ToDoClass()
        dogToDo.description = "Walk the Dog"
        //important is set to false by default
        
        return [swiftToDo, dogToDo]
    }*/
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
        cell.textLabel?.text = eachToDo.description
        
        if eachToDo.important {
            cell.textLabel?.text = "❗️" + eachToDo.description
        }else{
            cell.textLabel?.text = eachToDo.description
        }

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoTVC = segue.destination as? AddToDoViewController {
            nextAddToDoTVC.previousToDoTVC = self
        }
        
        if let nextCompleteToDoVC = segue.destination as? CompleteToDoViewController {
            if let choosenToDo = sender as? ToDoClass {
                nextCompleteToDoVC.selectedToDo = choosenToDo
                nextCompleteToDoVC.previousToDoTVC = self
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let eachToDo = listOfToDo[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }

}
