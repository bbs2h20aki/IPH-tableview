//
//  ViewController.swift
//  TableViews
//
//  Created by Fabian Kirchmann / BBS2H20A on 09.11.21.
//

import UIKit

class ViewController: UIViewController {
    //datsource
    var games = ["Far Cry 6","Civ 6","Cod","Battlefield"]
    
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        title = "Games"
        
        //leere uiview
        myTableView.tableFooterView = UIView()
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(!isEditing, animated: true)
        myTableView.setEditing(!myTableView.isEditing, animated: true)
    }


}

extension ViewController: UITableViewDataSource {
    //wie viele zellen sollen angezeigt werden
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    //wie sollen die zellen aussehen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = games[indexPath.row]
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    //cell bewgegen
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let selectedGame = games[sourceIndexPath.row]
        //löschen aus dem array
        games.remove(at: sourceIndexPath.row)
        
        games.insert(selectedGame, at: destinationIndexPath.row)
    }
    //löschen der cells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            games.remove(at: indexPath.row)
            //löschen aus der tableview
            myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
