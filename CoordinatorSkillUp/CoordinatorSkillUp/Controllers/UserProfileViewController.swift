//
//  ViewController.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/4/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UpdateWithUser {
    
    //input
    var user: User? {didSet { updateUserInfoOnUI() }}
    
    //output
    var didTapOnSelectCity: ( () -> Void )?

    @IBOutlet weak var labelUserInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Profile"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUserInfoOnUI()
    }
    
    @IBAction func selectAnotherCityButton(_ sender: Any) {
        didTapOnSelectCity?()
    }
    
    fileprivate func updateUserInfoOnUI() {
        labelUserInfo?.text = "User: \(user!.name) \n City: \(user!.city.name)"
    }
}
