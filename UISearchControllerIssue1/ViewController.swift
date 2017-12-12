//
//  ViewController.swift
//  UISearchControllerIssue1
//
//  Created by Patosin, Alexey on 12/12/2017.
//  Copyright © 2017 Patosin, Alexey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func presentSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        present(searchController, animated: true, completion: nil)
    }
    
    func pushViewController() {
        let tableViewController = MyTableViewController()
        navigationController?.pushViewController(tableViewController, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            presentSearchController()
        }
        else {
            pushViewController()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        if indexPath.row == 0 {
            cell.textLabel!.text = "Present UISearchController"
        }
        else {
            cell.textLabel!.text = "Push"
        }
        return cell
    }
}
