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
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        showAllVC()
    }
    
    fileprivate func showAllVC() {
        //first
        let firstVC = TabBarControllerFabric.makeFirstController()
        let tabBarItemFirst = UITabBarItem(title: "First", image: UIImage.init(named: "first")!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "first")!)
        firstVC.tabBarItem = tabBarItemFirst
        //second
        let secondVC = TabBarControllerFabric.makeSecondController()
        let tabBarItemSecond = UITabBarItem(title: "Second", image: UIImage.init(named: "second")!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "second")!)
        secondVC.tabBarItem = tabBarItemSecond
        //third
        let thirdVC = TabBarControllerFabric.makeThirdController()
        let tabBarItemThird = UITabBarItem(title: "Third", image: UIImage.init(named: "third")!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: "third")!)
        thirdVC.tabBarItem = tabBarItemThird
        
        
        tabBarController?.viewControllers = [firstVC, secondVC, thirdVC]
       
    }
    
}

struct TabBarControllerFabric {
    static func makeFirstController() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "FirstVC")
    }
    
    static func makeSecondController() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "SecondVC")
    }
    
    static func makeThirdController() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "ThirdVC")
    }
}
