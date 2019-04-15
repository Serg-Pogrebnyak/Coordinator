//
//  SecondVC.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/15/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    //output
    var didTapOnSegueButton: ( () -> Void )?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapOnSegueButton(_ sender: Any) {
        didTapOnSegueButton?()
    }
}
