//
//  ToDoTableViewController.swift
//  toDoList
//
//  Created by Scholar on 7/15/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        toDos = createToDos()

        
    }//VIEW DID LOAD ENDS
    
    func createToDos() -> [ToDo] {

      let swift = ToDo()
      swift.name = "Learn Swift"
      //swift.important = true

      let dog = ToDo()
      dog.name = "Walk the Dog"
        dog.important = false
      // important is set to false by default

      return [swift, dog]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count //makes # of rows == to # of items in array
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let toDo = toDos[indexPath.row]
        if toDo.important{
            cell.textLabel?.text = "🦕" + toDo.name
        }
        else{
            cell.textLabel?.text = toDo.name
        } // creating the cell that we print out
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDo{
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
