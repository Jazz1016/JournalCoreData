//
//  EntryTableViewController.swift
//  JournalCoreData
//
//  Created by James Lea on 4/26/21.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.fetchEntries()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            EntryController.shared.fetchEntries()
            tableView.reloadData()
        }
    
    var entry: Entry?
    
    // MARK: - Actions
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        let entry = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = DateFormatter.entryTime.string(from: entry.timestamp ?? Date())
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            
            EntryController.shared.deleteEntry(entry: entryToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        guard let index = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? EntryDetailViewController else {return}
        let entry = EntryController.shared.entries[index.row]
        destination.entry = entry
        }
}
