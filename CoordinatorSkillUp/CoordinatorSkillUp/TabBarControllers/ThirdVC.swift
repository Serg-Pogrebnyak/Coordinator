//
//  ThirdVC.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/15/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    //output
    var didTapOnSegueButton: ( () -> Void )?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Third"
    }
    
    @IBAction func didTapOnSegueButton(_ sender: Any) {
        didTapOnSegueButton?()
    }
}
