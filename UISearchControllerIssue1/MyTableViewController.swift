//
//  MyTableViewController.swift
//  UISearchControllerIssue1
//
//  Created by Patosin, Alexey on 12/12/2017.
//  Copyright © 2017 Patosin, Alexey. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        navigationItem.searchController = searchController
    }
}

extension MyTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
    }

}
