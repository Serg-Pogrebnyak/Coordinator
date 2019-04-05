//
//  SelectCityTableViewController.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/4/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class SelectCityTableViewController: UITableViewController, CitiesOutput {
    
    //output
    var selectCity: ( (City) -> Void )?
    
    //mocked lict of city
    fileprivate let cityArray = [City(name: "Moscov"),
                                 City(name: "Kharkiv"),
                                 City(name: "Kuiv"),
                                 City(name: "NY"),
                                 City(name: "Berlin"),
                                 City(name: "Krakov"),
                                 City(name: "Warshava")]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "City list"
        let nib = UINib.init(nibName: "CityCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CityCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.setDataInCell(city: cityArray[indexPath.row])
        return cell
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectCity?(cityArray[indexPath.row])
    }
}
