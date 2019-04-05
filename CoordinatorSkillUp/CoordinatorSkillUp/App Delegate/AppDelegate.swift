//
//  AppDelegate.swift
//  CoordinatorSkillUp
//
//  Created by Sergey Pohrebnuak on 4/4/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: UserEditProfileCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard  let navigationController = window?.rootViewController as? UINavigationController else {
            return true
        }
        let user = User(name: "Serg Pogrebnyak", city: City(name: "Kharkiv"))
        coordinator = UserEditProfileCoordinator(user: user, navigationController: navigationController)
        coordinator.start()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
