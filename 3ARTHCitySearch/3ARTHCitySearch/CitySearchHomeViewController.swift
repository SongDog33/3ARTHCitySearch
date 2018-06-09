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
    var citiesArray : [City]?
    var isSearching = false
    
    let jsonHandler = JSONHandler.defaultHandler
    var filteredCities : [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let arr = jsonHandler.parseCityArray()
        citiesArray = orderCitiesArray(arr: arr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    //MARK: UISearchBarDelegate Method for filtering search text
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            tableView.reloadData()
        } else{
            isSearching = true
            filteredCities = (citiesArray?.filter {
                $0.name.lowercased().hasPrefix(searchText.lowercased())
                })!
                
            tableView.reloadData()
        }
    }
    
    //MARK: UITableView Datasource & Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredCities.count
        }
        return (citiesArray?.count)!
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitySearchTableViewCell", for: indexPath) as! CitySearchTableViewCell
        var city : City
        
        if isSearching {
            city = filteredCities[indexPath.row]
        } else {
            city = (citiesArray?[indexPath.row])!
        }
        cell.nameLabel.text = "\(city.name), \(city.country)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CityMapSegue" {
            let vc = segue.destination as! CityMapViewController
            let cell = sender as! CitySearchTableViewCell
            let idxPath = tableView.indexPath(for: cell)
            
            if isSearching {
                vc.city = filteredCities[(idxPath?.row)!]
            } else {
                vc.city = citiesArray?[(idxPath?.row)!]
            }
        }
    }

}
