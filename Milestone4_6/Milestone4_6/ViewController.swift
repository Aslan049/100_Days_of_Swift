//
//  ViewController.swift
//  Milestone4_6
//
//  Created by Aslan Korkmaz on 4.04.2025.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Shopping List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertControl))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clear))
        
        if let savedShoppingList = UserDefaults.standard.array(forKey: "shoppingList") as? [String] {
            shoppingList = savedShoppingList
        }
        
       
    }
    
    @objc func alertControl() {
        let alert = UIAlertController(title: "BUY", message: "You wanna buy", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "BUY", style: .default, handler: { [weak alert, weak self] _ in
            if let text = alert?.textFields?.first?.text {
                if !text.isEmpty {
                    self?.shoppingList.insert(text, at: 0)
                    self?.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                    UserDefaults.standard.set(self?.shoppingList, forKey: "shoppingList")
                } else {
                    let warningAlert = UIAlertController(title: "Warning", message: "You did not choose anything", preferredStyle: .alert)
                    warningAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self?.present(warningAlert, animated: true)
                }
            }
        }))
        present(alert, animated: true)
    }
    
    @objc func clear() {
        shoppingList.removeAll()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vc = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        vc.textLabel?.text = shoppingList[indexPath.row]
        return vc
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

