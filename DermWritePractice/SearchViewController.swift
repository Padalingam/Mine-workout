//
//  SearchViewController.swift
//  DermWritePractice
//
//  Created by Padalingam A on 5/26/17.
//  Copyright © 2017 Padalingam A. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    var searchBar: UISearchBar!
    var searchBarButtonItem: UIBarButtonItem?
    var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search Bar Demo"
        //self.navigationItem.titleView = searchButton
        self.searchBarButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SearchViewController.searchButtonAction(sender:)))
           // self.navigationItem.rightBarButtonItem = self.searchBarButtonItem
        self.searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.showsScopeBar = true
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func search(_ sender: Any) {
        let resultVC = UITableViewController(style: UITableViewStyle.plain)
        let searchVC = UISearchController(searchResultsController: resultVC)
        self.present(searchVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func searchButtonAction(sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: { 
            
        }) { (success) in
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.titleView = self.searchBar
            self.searchBar.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: { 
                self.searchBar.alpha = 1
            }, completion: { (success) in
                self.searchBar.becomeFirstResponder()
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
