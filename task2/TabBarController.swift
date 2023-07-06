//
//  ViewController.swift
//  task2
//
//  Created by Maxim Korolyuk on 05.07.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        
    }
    
    private func createTabBar(){
        viewControllers = [
            createViewController(viewController: FirstViewController(),
                                 title: "",
                                 image: UIImage(systemName: "doc.text.image")),
            createViewController(viewController: SecondViewController(),
                                 title: "",
                                 image: UIImage(systemName: "calendar")),
            createViewController(viewController: ThirdViewController(),
                                 title: "",
                                 image: UIImage(systemName: "newspaper")),
            
        ]
        
        tabBar.unselectedItemTintColor =  UIColor { _ in #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) }
            tabBar.tintColor = UIColor { _ in #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) }
        
    }
        
    private func createViewContoller(viewController: UIViewController, title: String, image: UIImage?) ->
    UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        
        return navigationController
        
    }
}

