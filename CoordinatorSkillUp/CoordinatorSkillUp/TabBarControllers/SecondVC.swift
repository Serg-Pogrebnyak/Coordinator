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
    
    @IBOutlet fileprivate weak var buttonSegue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
        buttonSegue.isAccessibilityElement = true
    }
    
    @IBAction func tapOnSegueButton(_ sender: Any) {
        didTapOnSegueButton?()
    }
}
