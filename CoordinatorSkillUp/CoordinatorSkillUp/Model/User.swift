//
//  User.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/4/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var city: City
    
    init(name: String, city: City) {
        self.name = name
        self.city = city
    }
}
