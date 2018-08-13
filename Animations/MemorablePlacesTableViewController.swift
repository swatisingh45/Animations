//
//  MemorablePlacesTableViewController.swift
//  Animations
//
//  Created by Swati Singh on 19/06/18.
//  Copyright © 2018 Swati Singh. All rights reserved.
//

import UIKit

// Global varible; not commonly used in apps
var places = [Dictionary<String, String>()]
var activePlaces = -1


class MemorablePlacesTableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    /* We will move the code to ViewDidAppear becuase the function when in ViewDidLoad doesn't get called when the back button is pressed. */
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if places.count == 1 && places[0].count == 0 {
            places.remove(at: 0)
            //Setting one default place
            places.append(["name" : "Taj Mahal", "lat" : "27.88", "lon" : "78.899"])
            
        }
        activePlaces = -1
        
        table.reloadData()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

        if places[indexPath.row]["name"] != nil {
        
        cell.textLabel?.text = places[indexPath.row]["name"]

        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activePlaces = indexPath.row
        performSegue(withIdentifier: "toMap", sender: nil)
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
            
            // Delete the row from the data source or swipping left basically, in order to delete the row 
            places.remove(at: indexPath.row)
        
        table.reloadData()
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
