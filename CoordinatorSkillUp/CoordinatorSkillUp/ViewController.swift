//
//  ViewController.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/4/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //input
    var user: User? {didSet { updateUserInfoOnUI() }}
    
    //output
    var didTapOnSelectCity: ( () -> Void )?

    @IBOutlet weak var labelUserInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUserInfoOnUI()
    }
    
    @IBAction func selectAnotherCityButton(_ sender: Any) {
        didTapOnSelectCity?()
    }
    
    fileprivate func updateUserInfoOnUI() {
        
    }
}
