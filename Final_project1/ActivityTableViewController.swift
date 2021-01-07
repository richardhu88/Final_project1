//
//  ActivityTableViewController.swift
//  Final_project1
//
//  Created by 胡嘉樺 on 2021/1/7.
//

import UIKit
import Firebase

class ActivityTableViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var subneameLabel: UILabel!
    
    
    @IBAction func logoutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil {
                do {
                    try Auth.auth().signOut()
                    dismiss(animated: true, completion: nil)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! ActivityTableViewCell

        cell.nameLabel.text = "測試活動"
        cell.subnameLabel.text = ""
        cell.activityImage.image = UIImage(named: "pencil")

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            // Segue to the second view controller
            self.performSegue(withIdentifier: "gomap", sender: self)
        }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let map = segue.destination as! MapViewController
//        map
//    }
    

}
