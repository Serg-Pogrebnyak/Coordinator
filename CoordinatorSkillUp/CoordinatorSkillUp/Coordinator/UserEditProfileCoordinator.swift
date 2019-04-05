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
    var cityArray: [City] {get set}
}

protocol RegionOutput {
    var selectRegion: ( (Region) -> Void )? {get set}
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
            //self?.showRegionScreen()
        }
        navigationController?.pushViewController(controller, animated: false)
    }
    
    private func showRegionScreen() {
        var controller = UIStoryboard.makeRegionController()
        controller.selectRegion = { [weak self] region in
            self?.showCitiesScreen(cityArray: region.cityArray)
        }
        navigationController?.pushViewController(controller as! UIViewController, animated: true)
    }
    
    private func showCitiesScreen(cityArray: [City]? = nil) {
        var controller = UIStoryboard.makeCitiesController()
        if cityArray != nil {
           controller.cityArray = cityArray!
        }
        controller.selectCity = { [weak self] city in
            self?.user.city = city
            self?.navigationController?.viewControllers.forEach({ (viewController) in
                if ((viewController as? UpdateWithUser) != nil) {
                    self?.navigationController?.popToViewController(viewController, animated: true)
                }
            })
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
    
    static func makeRegionController() -> RegionOutput {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "MagicCityTableView") as! RegionOutput
    }
    
    static func makeCitiesController() -> CitiesOutput {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "SelectCityVC") as! CitiesOutput
    }
}
