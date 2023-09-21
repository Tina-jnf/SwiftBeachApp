//
//  searchController.swift
//  JannatifarTinaFinalProject
//
//  Created by mahta 96 on 12/6/22.
//

import Foundation
import UIKit

class resultsVC:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .blue
    }
    
}

class searchController:UIViewController, UISearchResultsUpdating{
    
    
    let search=UISearchController(searchResultsController: resultsVC())
    override func viewDidLoad() {
        title="Search"
        search.searchResultsUpdater=self
        navigationItem.searchController=search
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{
            return
        }
    }
}
