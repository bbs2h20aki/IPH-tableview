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
    
}
