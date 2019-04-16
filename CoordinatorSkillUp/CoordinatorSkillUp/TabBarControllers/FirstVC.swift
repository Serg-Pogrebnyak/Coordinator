//
//  FirstVC.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/15/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class FirstVC: UIViewController, UpdateWithUser {

    //input
    var user: User?
    
    @IBOutlet fileprivate weak var userInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUserInfoOnScreen()
    }
    
    fileprivate func updateUserInfoOnScreen() {
        userInfoLabel.text = "User: \(user!.name) \n City: \(user!.city.name)"
    }
}
