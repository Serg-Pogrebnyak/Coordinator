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
    private var user: User
    
    private var nextCoordinator: UserEditProfileCoordinator?
    
    private let firstNavigation = UINavigationController()
    private let secondNavigation = UINavigationController()
    private let thirdNavigation = UINavigationController()
    
    init(user: User, tabBarController: UITabBarController) {
        self.user = user
        self.tabBarController = tabBarController
    }
    
    func start() {
        showAllVC()
    }
    
    func updateUser(user: User) {
        self.user = user
        tabBarController?.viewControllers?.forEach({ (VC) in
            if VC is UINavigationController {
                for controller in (VC as! UINavigationController).viewControllers {
                    (controller as? UpdateWithUser)?.user = user
                }
            } else {
                (VC as? UpdateWithUser)?.user = user
            }
        })
    }
    
    fileprivate func showAllVC() {
        //first
        let firstVC = TabBarControllerFabric.makeFirstController()
        firstVC.user = self.user
        //second
        let secondVC = TabBarControllerFabric.makeSecondController()
        secondVC.didTapOnSegueButton = { [weak self] in
            self?.showUserDetailFlow()
        }
        //third
        let thirdVC = TabBarControllerFabric.makeThirdController()
        thirdVC.didTapOnSegueButton = {
            thirdVC.navigationController?.pushViewController(TabBarControllerFabric.makeFourthController(), animated: true)
        }
        
        self.firstNavigation.viewControllers = [firstVC]
        self.secondNavigation.viewControllers = [secondVC]
        self.thirdNavigation.viewControllers = [thirdVC]
        
        tabBarController?.viewControllers = [self.firstNavigation, self.secondNavigation, self.thirdNavigation]
    }
    
    fileprivate func showUserDetailFlow() {
        let userDetailCoordinator = UserEditProfileCoordinator.init(user: self.user, navigationController: self.secondNavigation, rootCoordinator: self)
        self.nextCoordinator = userDetailCoordinator
        self.nextCoordinator!.start()
    }
}

struct TabBarControllerFabric {
    
    static private var storyboardName = "Main"
    
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
    
    static func makeFourthController() -> FourthVC {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "FourthVC") as! FourthVC
    }
}
