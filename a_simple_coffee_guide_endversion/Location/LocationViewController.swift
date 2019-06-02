//
//  LocationViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 22.05.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var DE_BarButtonItem: UIBarButtonItem!
    
    // let/var
    let searchController = UISearchController(searchResultsController: nil)
    var locations = [Location]()
    var filteredLocations = [Location]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupSearchBar()
       
        tableView.delegate = self
        tableView.dataSource = self
        populateTableView()
        
        
        

    }
    
    func setupNavBar() {
    // eliminate 1pt line
    self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    // Search
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search.."
        navigationItem.searchController = searchController
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.backgroundColor = .white
        searchController.searchBar.tintColor = .black
        definesPresentationContext = true
        
        self.searchController.searchBar.setValue("X", forKey: "cancelButtonText")

    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredLocations = locations.filter({( location : Location) -> Bool in
            return location.city.lowercased().contains(searchText.lowercased())
        })
    
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    // Filling the Data
    
    func populateTableView() {
        locations = [
            Location(city: "Barcelona", imageName: "Barcelona",
                     cafes: [Cafe(name: "Itacate", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.379895, longitude: 2.159335),
                             Cafe(name: "Sopa", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 41.402390, longitude: 2.195293),
                             Cafe(name: "Federal", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food, Features.Cake], latitude: 41.378008, longitude: 2.177775),
                            Cafe(name: "Nappuccino", image: "Cafe_Itercate", features: [Features.Wifi, Features.Food], latitude: 41.385280, longitude:  2.161633),
                        Cafe(name: "CafeCosmo", image: "Cafe_Itercate", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.387472, longitude: 2.162690),
                            Cafe(name: "Satan's Coffee - Gòtic", image: "Cafe_Itercate", features: [Features.Food, Features.Vegan], latitude: 41.382651, longitude: 2.175212),
                            Cafe(name: "Satan´s Coffee - Eixample", image: "Cafe_Itercate", features: [Features.Food, Features.Vegan, Features.Cake], latitude: 41.393602, longitude: 2.174269)]),
            Location(city: "Cologne", imageName: "Cologne", cafes: [Cafe(name: "", image: "", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 0, longitude: 0)]),
            Location(city: "Madrid", imageName: "Madrid", cafes: [Cafe(name: "", image: "", features: [Features.Wifi, Features.Food, Features.Vegan, Features.Cake, Features.Plug], latitude: 0, longitude: 0)])
    ]
    }
    
    
    
    @IBAction func DE_BarButtonItemTapped(_ sender: UIBarButtonItem) {
        
    }
}


extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationTableViewCell
        cell.selectionStyle = .none

        let location : Location
        
        if isFiltering() {
            location = filteredLocations[indexPath.row]
        } else {
            location = locations[indexPath.row]
        }
        cell.cellLabel.text = location.city
        cell.locationImageView.image = UIImage(named: location.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension LocationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CityViewController") as? CityViewController {
            let location : Location
            if isFiltering() {
                location = filteredLocations[indexPath.row]
                vc.passedlocation = location
            } else {
                location = locations[indexPath.row]
                vc.passedlocation = location
            }
            parent?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension LocationViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
}

