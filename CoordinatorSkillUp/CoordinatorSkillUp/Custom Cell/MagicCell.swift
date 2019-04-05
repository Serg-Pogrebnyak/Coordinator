//
//  MagicCell.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/5/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class MagicCell: UITableViewCell {

    @IBOutlet fileprivate weak var labelCity: UILabel!

    func setDataInCell(_ city: City) {
        labelCity.text = city.name
        self.backgroundColor = UIColor(red:     .random(in: 0...1),
                                       green:   .random(in: 0...1),
                                       blue:    .random(in: 0...1),
                                       alpha:   .random(in: 0...1))
    }

}
