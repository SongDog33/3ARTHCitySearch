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
    var citiesArray : [Any]?

    let jsonHandler = JSONHandler.defaultHandler
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        let arr = jsonHandler.parseCityArray()
        citiesArray = orderCitiesArray(arr: arr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITableView Datasource & Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (citiesArray?.count)!
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitySearchTableViewCell", for: indexPath) as! CitySearchTableViewCell
        let city = citiesArray?[indexPath.row] as! City
        cell.nameLabel.text = "\(city.name), \(city.country)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CityMapSegue" {
            let vc = segue.destination as! CityMapViewController
            let cell = sender as! CitySearchTableViewCell
            let idxPath = tableView.indexPath(for: cell)
            vc.city = citiesArray?[(idxPath?.row)!] as? City
        }
    }

}
