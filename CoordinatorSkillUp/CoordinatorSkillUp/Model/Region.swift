//
//  Region.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/5/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import Foundation

struct Region: Naming {
    var name: String
    fileprivate let cityArray = [City(name: "Moscov"),
                                 City(name: "Kharkiv"),
                                 City(name: "Kuiv"),
                                 City(name: "NY"),
                                 City(name: "Berlin"),
                                 City(name: "Krakov"),
                                 City(name: "Warshava")]
}
