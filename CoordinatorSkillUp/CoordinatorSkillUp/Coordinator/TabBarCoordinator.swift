//
//  TabBarControllerFlow.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/15/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

final class TabBarCoordinator {

    private weak var tabBarController: UITabBarController?
    private var nextCoordibator: UserEditProfileCoordinator?
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        showAllVC()
    }
    
    fileprivate func showAllVC() {
        //first
        let firstVC = TabBarControllerFabric.makeFirstController()
        //second
        let secondVC = TabBarControllerFabric.makeSecondController()
        secondVC.didTapOnSegueButton = { [weak self] in
            self?.showUserDetailFlow()
        }
        //third
        let thirdVC = TabBarControllerFabric.makeThirdController()
        
        
        tabBarController?.viewControllers = [firstVC, secondVC, thirdVC]
    }
    
    fileprivate func showUserDetailFlow() {
        let navigation = TabBarControllerFabric.getUserDetailNavigation()
        let user = User(name: "Serg Pogrebnyak", city: City(name: "Kharkiv"))
        let userDetailCoordinator = UserEditProfileCoordinator.init(user: user, navigationController: navigation)
        self.nextCoordibator = userDetailCoordinator
        self.nextCoordibator!.start()
        
        //first
        let firstVC = TabBarControllerFabric.makeFirstController()
        //third
        let thirdVC = TabBarControllerFabric.makeThirdController()
        
        
        tabBarController?.viewControllers = [firstVC, navigation, thirdVC]
    }
    
    
}

struct TabBarControllerFabric {
    
    static private var storyboardName = "Main"
    static private var nextCoordinatorStoryboardName = "NavigationControllFlow"
    
    static func makeFirstController() -> FirstVC {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: Bundle.main)
        let firstVC =  storyboard.instantiateViewController(withIdentifier: "FirstVC") as! FirstVC
        let tabBarItemFirst = UITabBarItem(title: "First", image: UIImage.init(named: "first")!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "first")!)
        firstVC.tabBarItem = tabBarItemFirst
        return firstVC
    }
    
    static func makeSecondController() -> SecondVC {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: Bundle.main)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        let tabBarItemSecond = UITabBarItem(title: "Second", image: UIImage.init(named: "second")!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "second")!)
        secondVC.tabBarItem = tabBarItemSecond
        return secondVC
    }
    
    static func makeThirdController() -> ThirdVC {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: Bundle.main)
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        let tabBarItemThird = UITabBarItem(title: "Third", image: UIImage.init(named: "third")!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "third")!)
        thirdVC.tabBarItem = tabBarItemThird
        return thirdVC
    }
    
    static func getUserDetailNavigation() -> UINavigationController {
        let storyboard = UIStoryboard.init(name: nextCoordinatorStoryboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "UserDetailNavigationController") as! UINavigationController
    }
}
