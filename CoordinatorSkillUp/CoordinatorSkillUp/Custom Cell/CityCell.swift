//
//  CityCell.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/4/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet fileprivate weak var nameCityLabel: UILabel!
    
    func setDataInCell(city: City) {
        nameCityLabel.text = city.name
    }
}
