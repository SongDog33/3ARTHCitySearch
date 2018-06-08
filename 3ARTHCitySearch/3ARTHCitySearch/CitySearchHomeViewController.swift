//
//  CitySearchHomeViewController.swift
//  3ARTHCitySearch
//
//  Created by Joel Myers on 6/7/18.
//  Copyright © 2018 4Backbase. All rights reserved.
//

import UIKit

class CitySearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
}

class CitySearchHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableView Datasource & Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitySearchTableViewCell", for: indexPath) as! CitySearchTableViewCell
        
        cell.nameLabel.text = "My City"
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "CityMapSegue" {
//
//
//        }
//    }

}
