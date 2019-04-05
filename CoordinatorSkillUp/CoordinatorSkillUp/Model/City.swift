//
//  City.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/4/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import Foundation

protocol Naming {
    var name: String {get set}
}
struct City: Naming {
    var name: String
}
