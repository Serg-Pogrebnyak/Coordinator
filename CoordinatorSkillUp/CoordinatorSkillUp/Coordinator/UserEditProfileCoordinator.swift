//
//  UserEditProfileCoordinator.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/5/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateWithUser: class {
    var user: User? {get set}
}

protocol CitiesOutput {
    var selectCity: ((City) -> Void )? {get set}
}

final class UserEditProfileCoordinator {
    // MARK: - Properties
    private var user: User {didSet { updateInterfaces()} }
    private weak var navigationController: UINavigationController?
    
    // MARK: - init
    init(user: User, navigationController: UINavigationController) {
        self.user = user
        self.navigationController = navigationController
    }
    
    func start() {
        showUserEditScreen()
    }
    
    // MARK: - Private function
    private func showUserEditScreen() {
        let controller = UIStoryboard.makeUserEditController()
        controller.user = user
        controller.didTapOnSelectCity = { [weak self] in
            self?.showCitiesScreen()
        }
        navigationController?.pushViewController(controller, animated: false)
    }
    
    private func showCitiesScreen() {
        var controller = UIStoryboard.makeCitiesController()
        controller.selectCity = { [weak self] city in
            self?.user.city = city
            _ = self?.navigationController?.popViewController(animated: true)
        }
        navigationController?.pushViewController(controller as! UIViewController, animated: true)
    }
    
    private func updateInterfaces() {
        navigationController?.viewControllers.forEach({ ($0 as? UpdateWithUser)?.user = user })
    }
}

extension UIStoryboard {
    static func makeUserEditController() -> UserProfileViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileViewController
    }
    
    static func makeCitiesController() -> CitiesOutput {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "SelectCityVC") as! CitiesOutput
    }
}
