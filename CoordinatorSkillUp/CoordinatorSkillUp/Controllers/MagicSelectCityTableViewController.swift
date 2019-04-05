//
//  MagicSelectCityTableViewController.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/5/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class MagicSelectCityTableViewController: UITableViewController, RegionOutput {
    
    //output
    var selectRegion: ( (Region) -> Void )?
    
    //mocked lict of city
    fileprivate let regionArray = [Region(name: "Kharkiv reg"),
                                   Region(name: "Kuiv reg"),
                                   Region(name: "Ternopil reg"),
                                   Region(name: "Kherson reg"),
                                   Region(name: "Odessa reg"),
                                   Region(name: "Lviv reg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Magic City list"
        let nib = UINib.init(nibName: "MagicCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MagicCell")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagicCell", for: indexPath) as! MagicCell
        cell.setDataInCell(regionArray[indexPath.row])
        return cell
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectRegion?(regionArray[indexPath.row])
    }
}
